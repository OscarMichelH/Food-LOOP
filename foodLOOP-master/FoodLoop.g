grammar FoodLOOP;

options { language = Ruby; }

@header {
  require "lib/Manager"
  require "lib/QuadrupleGenerator"
  require "lib/DimensionGenerator"
}

@members {
  \$manager = Manager.new()
  \$quads = QuadrupleGenerator.new(\$manager)
  \$dim = DimensionGenerator.new(\$manager)
  \$class_aux
  \$method_aux
  \$func_aux
  \$dim_aux
  \$assgn_aux
}

PROGRAM: 'menu';
PRINT: 'mostrar';
VAR: 'ingrediente';
CTE: 'utensilio';
IF: 'si';
ELSE: 'sino';
AND: '&&';
OR: '||';
GT: '>';
GTE: '>=';
LT: '<';
LTE: '<=';
INTEGER: 'nocortable';
FLOAT: 'cortable';
STRING: 'nombre';
BOOLEAN: 'estado';
VOID: 'proceso';
FUNCTION: 'receta';
FIN: 'terminar';
RETURN: 'servir';
INPUT: 'traer';
WHILE: 'mientras';
CLASS: 'platillo';
WORD: '\'' ( ~( '\'' | '\\' ) | '\\' . )* '\'' | '"'  ( ~( '"'  | '\\' ) | '\\' . )* '"';
NUM_I: ('0'..'9')+;
NUM_F: ('0'..'9')+ '.' ('0'..'9')+;
BOOL: ( 'verdadero' | 'falso');
ID: ( 'a' .. 'z' | 'A' .. 'Z' ) ( ( 'a' .. 'z' | 'A' .. 'Z' ) | '_' | ('0' .. '9') )*;
LPAREN: '(';
RPAREN: ')';
LKEY: '[';
RKEY: ']';
EQUAL: '=';
DIF: '<>';
SIMILAR: '==';
COMMA: ',';
DDOT: ':';
SEMI: ';';
PLUS: '+';
SUB: '-';
DIV: '/';
MUL: '*';
INHERITS: '<<';
DOT: '.';
WHITESPACE:  ('\t'|'\f'|'\n'|'\r'|' '|'\u00A0')+{ $channel=HIDDEN; };

// -------------------------------------------------------
//                        PARSER
// -------------------------------------------------------

start: { \$quads.goto_main() } ( comments )* ( food_class )*  ( function )*  program; finally { exit }

program: PROGRAM { \$quads.fill_main_quad() } ID DDOT ( estatute | dim_dec | var_dec | cte_dec | comments )* FIN PROGRAM { \$manager.finish() };

estatute: assignment | condition | output | while_loop | method_call SEMI | func_call SEMI;

dim_dec: VAR ID { \$dim_aux = $ID.text } DDOT type { \$manager.add_dim_variable($ID.text, $type.text, true) } LKEY { \$dim.new_dimension($ID.text) } NUM_I { \$dim.add_limit($ID.text, $NUM_I.text) } ( mat_dim )? RKEY { \$dim.calculate_m($ID.text) } SEMI { \$dim.reset_r()};

mat_dim: COMMA { \$dim.new_dimension(\$dim_aux) } NUM_I { \$dim.add_limit(\$dim_aux, $NUM_I.text) };

dim_obj: LKEY { \$quads.has_dim() } exp { \$quads.generate_limit_quad() } ( COMMA { \$quads.update_dim() } exp { \$quads.generate_limit_quad() } )? RKEY { \$quads.generate_dim_quads() };

var_dec: VAR ID { \$assgn_aux = $ID.text} DDOT type { \$manager.add_variable($ID.text, $type.text) } ( EQUAL { \$quads.add_id($ID.text, nil) } { \$quads.add_operator($EQUAL.text) } ( mega_expression  { \$quads.assign_quad() } | input { \$quads.assign_read() } ) )? SEMI;

cte_dec: CTE ID { \$assgn_aux = $ID.text} DDOT type { \$manager.add_constant($ID.text, $type.text) } ( EQUAL { \$quads.add_id($ID.text, nil) } { \$quads.add_operator($EQUAL.text) } ( mega_expression  { \$quads.assign_quad() } ) ) SEMI;

assignment: ID { \$assgn_aux = $ID.text} { \$quads.variable_exists?($ID.text) } { \$quads.add_id($ID.text, nil) } ( { \$dim_aux = $ID.text } dim_obj )?  { \$quads.check_dim($ID.text) } ( EQUAL  { \$quads.add_operator($EQUAL.text) } ( mega_expression { \$quads.assign_quad() } | input { \$quads.assign_read() } ) ) SEMI;

condition: IF LPAREN mega_expression RPAREN { \$quads.gotof() } DDOT ( estatute )* ( ELSE { \$quads.goto() } block | FIN ) { \$quads.fill_main_quad() } IF;

while_loop: WHILE { \$quads.add_jump() } LPAREN mega_expression RPAREN { \$quads.gotof() } block WHILE { \$quads.goto_while() };

input: INPUT LPAREN { \$quads.read(\$assgn_aux) } RPAREN;

output: PRINT LPAREN mega_expression RPAREN { \$quads.write() } SEMI;

parameters: LPAREN ( type ID ( COMMA type ID )* )? RPAREN;

function: FUNCTION ( type ) ID parameters DDOT { \$manager.add_function($ID.text, $parameters.text, $type.text)} ( estatute | var_dec | dim_dec | comments)* ( RETURN mega_expression { \$quads.return($ID.text) } SEMI )? FIN FUNCTION { \$quads.end_function() } { \$manager.reset_context() };

block: DDOT ( estatute )*  FIN;

func_call: ID { \$quads.function_exists?($ID.text) } { \$func_aux = $ID.text } { \$quads.era($ID.text) } func_call_parameters { \$quads.get_return_value() };

func_call_parameters: LPAREN ( ( mega_expression ) { \$quads.parameter(\$func_aux) } ( COMMA ( mega_expression ) { \$quads.parameter(\$func_aux) } )* )?  { \$quads.verify_func_param_count(\$func_aux) }  RPAREN { \$quads.go_sub(\$func_aux) };

mega_expression: super_expression ((AND  { \$quads.add_operator($AND.text) } | OR { \$quads.add_operator($OR.text) } ) super_expression { \$quads.is_mega_expression_pending() } )?;

super_expression: exp ( ( GT  { \$quads.add_operator($GT.text) } |GTE { \$quads.add_operator($GTE.text) } |LT { \$quads.add_operator($LT.text) } |LTE { \$quads.add_operator($LTE.text) } |DIF { \$quads.add_operator($DIF.text) } |SIMILAR  { \$quads.add_operator($SIMILAR.text) } ) exp { \$quads.is_super_expression_pending() } )?;

exp: term ((PLUS  { \$quads.add_operator($PLUS.text) } | SUB  { \$quads.add_operator($SUB.text) } ) term { \$quads.is_exp_pending() } )*;

term: factor ( ( MUL { \$quads.add_operator($MUL.text) } | DIV { \$quads.add_operator($DIV.text) } ) factor { \$quads.is_term_pending() } )*;

factor: ID { \$quads.add_id($ID.text, nil) } ( { \$dim_aux = $ID.text } dim_obj )? { \$quads.check_dim($ID.text) } | LPAREN { \$quads.add_false_bottom($LPAREN.text) } mega_expression RPAREN { \$quads.remove_false_bottom() } | value { \$quads.add_id(nil, $value.text) } | func_call | method_call;

type: STRING | BOOLEAN | FLOAT | INTEGER | VOID | ID;

value: WORD | NUM_F | NUM_I | BOOL;

food_class: CLASS ID { \$class_aux = $ID.text } { \$manager.add_class($ID.text, nil) } inherits?  DDOT ( function | dim_dec | var_dec | comments )* FIN CLASS { \$manager.reset_class_context() };

inherits: ( INHERITS ID ) { \$manager.main_context.class_directories.classes[\$class_aux].inherits_of = $ID.text } { \$manager.inherits_class_context($ID.text) };

method_call: ID {\$method_aux = $ID.text} DOT method_call_params { \$quads.get_return_value() };

method_call_params: ID { \$func_aux = $ID.text } { \$quads.method_exists?(\$method_aux, $ID.text) } { \$quads.era_method(\$method_aux, $ID.text) } method_call_parameters;

method_call_parameters: LPAREN ( ( mega_expression ) { \$quads.method_parameter(\$method_aux ,\$func_aux) } ( COMMA ( mega_expression ) { \$quads.method_parameter(\$method_aux ,\$func_aux) } )* )? { \$quads.verify_method_param_count(\$method_aux ,\$func_aux) } RPAREN { \$quads.go_sub_method(\$method_aux, \$func_aux) };

comments: DIV WORD DIV;
