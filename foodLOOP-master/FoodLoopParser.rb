#!/usr/bin/env ruby
#
# FoodLOOP.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: FoodLOOP.g
# Generated at: 2018-11-20 04:30:35
#

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!

Failed to load the ANTLR3 runtime library (version 1.10.0):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:

  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin

  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'

rescue LoadError

  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end

  # 3: try to activate the antlr3 gem
  begin
    defined?( gem ) and gem( 'antlr3', '~> 1.10.0' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end

  require 'antlr3'

end
# <~~~ end load path setup

# - - - - - - begin action @parser::header - - - - - -
# FoodLOOP.g


  require "lib/Manager"
  require "lib/QuadrupleGenerator"
  require "lib/DimensionGenerator"

# - - - - - - end action @parser::header - - - - - - -


module FoodLOOP
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :AND => 4, :BOOL => 5, :BOOLEAN => 6, :CLASS => 7, 
                   :COMMA => 8, :CTE => 9, :DDOT => 10, :DIF => 11, :DIV => 12, 
                   :DOT => 13, :ELSE => 14, :EQUAL => 15, :FIN => 16, :FLOAT => 17, 
                   :FUNCTION => 18, :GT => 19, :GTE => 20, :ID => 21, :IF => 22, 
                   :INHERITS => 23, :INPUT => 24, :INTEGER => 25, :LKEY => 26, 
                   :LPAREN => 27, :LT => 28, :LTE => 29, :MUL => 30, :NUM_F => 31, 
                   :NUM_I => 32, :OR => 33, :PLUS => 34, :PRINT => 35, :PROGRAM => 36, 
                   :RETURN => 37, :RKEY => 38, :RPAREN => 39, :SEMI => 40, 
                   :SIMILAR => 41, :STRING => 42, :SUB => 43, :VAR => 44, 
                   :VOID => 45, :WHILE => 46, :WHITESPACE => 47, :WORD => 48 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "AND", "BOOL", "BOOLEAN", "CLASS", "COMMA", "CTE", "DDOT", 
                    "DIF", "DIV", "DOT", "ELSE", "EQUAL", "FIN", "FLOAT", 
                    "FUNCTION", "GT", "GTE", "ID", "IF", "INHERITS", "INPUT", 
                    "INTEGER", "LKEY", "LPAREN", "LT", "LTE", "MUL", "NUM_F", 
                    "NUM_I", "OR", "PLUS", "PRINT", "PROGRAM", "RETURN", 
                    "RKEY", "RPAREN", "SEMI", "SIMILAR", "STRING", "SUB", 
                    "VAR", "VOID", "WHILE", "WHITESPACE", "WORD" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = FoodLOOP

    RULE_METHODS = [ :start, :program, :estatute, :dim_dec, :mat_dim, :dim_obj, 
                     :var_dec, :cte_dec, :assignment, :condition, :while_loop, 
                     :input, :output, :parameters, :function, :block, :func_call, 
                     :func_call_parameters, :mega_expression, :super_expression, 
                     :exp, :term, :factor, :type, :value, :food_class, :inherits, 
                     :method_call, :method_call_params, :method_call_parameters, 
                     :comments ].freeze

    include TokenData

    begin
      generated_using( "FoodLOOP.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    end

      $manager = Manager.new()
      $quads = QuadrupleGenerator.new($manager)
      $dim = DimensionGenerator.new($manager)
      $class_aux
      $method_aux
      $func_aux
      $dim_aux
      $assgn_aux

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    #
    # parser rule start
    #
    # (in FoodLOOP.g)
    # 72:1: start : ( comments )* ( food_class )* ( function )* program ;
    #
    def start
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      begin
      # at line 72:8: ( comments )* ( food_class )* ( function )* program
      # --> action
       $quads.goto_main() 
      # <-- action

      # at line 72:32: ( comments )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DIV )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 72:34: comments
          @state.following.push( TOKENS_FOLLOWING_comments_IN_start_460 )
          comments
          @state.following.pop

        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      # at line 72:46: ( food_class )*
      while true # decision 2
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == CLASS )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 72:48: food_class
          @state.following.push( TOKENS_FOLLOWING_food_class_IN_start_467 )
          food_class
          @state.following.pop

        else
          break # out of loop for decision 2
        end
      end # loop for decision 2

      # at line 72:63: ( function )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == FUNCTION )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 72:65: function
          @state.following.push( TOKENS_FOLLOWING_function_IN_start_475 )
          function
          @state.following.pop

        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      @state.following.push( TOKENS_FOLLOWING_program_IN_start_481 )
      program
      @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

       exit 
      end

      return 
    end



    #
    # parser rule program
    #
    # (in FoodLOOP.g)
    # 74:1: program : PROGRAM ID DDOT ( estatute | dim_dec | var_dec | cte_dec | comments )* FIN PROGRAM ;
    #
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      begin
      # at line 74:10: PROGRAM ID DDOT ( estatute | dim_dec | var_dec | cte_dec | comments )* FIN PROGRAM
      match( PROGRAM, TOKENS_FOLLOWING_PROGRAM_IN_program_492 )

      # --> action
       $quads.fill_main_quad() 
      # <-- action

      match( ID, TOKENS_FOLLOWING_ID_IN_program_496 )
      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_program_498 )
      # at line 74:55: ( estatute | dim_dec | var_dec | cte_dec | comments )*
      while true # decision 4
        alt_4 = 6
        case look_4 = @input.peek( 1 )
        when ID, IF, PRINT, WHILE then alt_4 = 1
        when VAR then look_4_3 = @input.peek( 2 )

        if ( look_4_3 == ID )
          look_4_6 = @input.peek( 3 )

          if ( look_4_6 == DDOT )
            look_4_7 = @input.peek( 4 )

            if ( look_4_7 == BOOLEAN || look_4_7 == FLOAT || look_4_7 == ID || look_4_7 == INTEGER || look_4_7 == STRING || look_4_7 == VOID )
              look_4_8 = @input.peek( 5 )

              if ( look_4_8 == LKEY )
                alt_4 = 2
              elsif ( look_4_8 == EQUAL || look_4_8 == SEMI )
                alt_4 = 3

              end

            end

          end

        end
        when CTE then alt_4 = 4
        when DIV then alt_4 = 5
        end
        case alt_4
        when 1
          # at line 74:57: estatute
          @state.following.push( TOKENS_FOLLOWING_estatute_IN_program_502 )
          estatute
          @state.following.pop

        when 2
          # at line 74:68: dim_dec
          @state.following.push( TOKENS_FOLLOWING_dim_dec_IN_program_506 )
          dim_dec
          @state.following.pop

        when 3
          # at line 74:78: var_dec
          @state.following.push( TOKENS_FOLLOWING_var_dec_IN_program_510 )
          var_dec
          @state.following.pop

        when 4
          # at line 74:88: cte_dec
          @state.following.push( TOKENS_FOLLOWING_cte_dec_IN_program_514 )
          cte_dec
          @state.following.pop

        when 5
          # at line 74:98: comments
          @state.following.push( TOKENS_FOLLOWING_comments_IN_program_518 )
          comments
          @state.following.pop

        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      match( FIN, TOKENS_FOLLOWING_FIN_IN_program_523 )
      match( PROGRAM, TOKENS_FOLLOWING_PROGRAM_IN_program_525 )

      # --> action
       $manager.finish() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )


      end

      return 
    end



    #
    # parser rule estatute
    #
    # (in FoodLOOP.g)
    # 76:1: estatute : ( assignment | condition | output | while_loop | method_call SEMI | func_call SEMI );
    #
    def estatute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      begin
      # at line 76:9: ( assignment | condition | output | while_loop | method_call SEMI | func_call SEMI )
      alt_5 = 6
      case look_5 = @input.peek( 1 )
      when ID then case look_5 = @input.peek( 2 )
      when EQUAL, LKEY then alt_5 = 1
      when DOT then alt_5 = 5
      when LPAREN then alt_5 = 6
      else
        raise NoViableAlternative( "", 5, 1 )

      end
      when IF then alt_5 = 2
      when PRINT then alt_5 = 3
      when WHILE then alt_5 = 4
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        # at line 76:11: assignment
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_estatute_534 )
        assignment
        @state.following.pop

      when 2
        # at line 76:24: condition
        @state.following.push( TOKENS_FOLLOWING_condition_IN_estatute_538 )
        condition
        @state.following.pop

      when 3
        # at line 76:36: output
        @state.following.push( TOKENS_FOLLOWING_output_IN_estatute_542 )
        output
        @state.following.pop

      when 4
        # at line 76:45: while_loop
        @state.following.push( TOKENS_FOLLOWING_while_loop_IN_estatute_546 )
        while_loop
        @state.following.pop

      when 5
        # at line 76:58: method_call SEMI
        @state.following.push( TOKENS_FOLLOWING_method_call_IN_estatute_550 )
        method_call
        @state.following.pop
        match( SEMI, TOKENS_FOLLOWING_SEMI_IN_estatute_552 )

      when 6
        # at line 76:77: func_call SEMI
        @state.following.push( TOKENS_FOLLOWING_func_call_IN_estatute_556 )
        func_call
        @state.following.pop
        match( SEMI, TOKENS_FOLLOWING_SEMI_IN_estatute_558 )

      end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )


      end

      return 
    end



    #
    # parser rule dim_dec
    #
    # (in FoodLOOP.g)
    # 78:1: dim_dec : VAR ID DDOT type LKEY NUM_I ( mat_dim )? RKEY SEMI ;
    #
    def dim_dec
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      __ID1__ = nil
      __NUM_I3__ = nil
      type2 = nil


      begin
      # at line 78:10: VAR ID DDOT type LKEY NUM_I ( mat_dim )? RKEY SEMI
      match( VAR, TOKENS_FOLLOWING_VAR_IN_dim_dec_565 )
      __ID1__ = match( ID, TOKENS_FOLLOWING_ID_IN_dim_dec_567 )

      # --> action
       $dim_aux = __ID1__.text 
      # <-- action

      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_dim_dec_571 )
      @state.following.push( TOKENS_FOLLOWING_type_IN_dim_dec_573 )
      type2 = type
      @state.following.pop

      # --> action
       $manager.add_dim_variable(__ID1__.text, ( type2 && @input.to_s( type2.start, type2.stop ) ), true) 
      # <-- action

      match( LKEY, TOKENS_FOLLOWING_LKEY_IN_dim_dec_577 )

      # --> action
       $dim.new_dimension(__ID1__.text) 
      # <-- action

      __NUM_I3__ = match( NUM_I, TOKENS_FOLLOWING_NUM_I_IN_dim_dec_581 )

      # --> action
       $dim.add_limit(__ID1__.text, __NUM_I3__.text) 
      # <-- action

      # at line 78:199: ( mat_dim )?
      alt_6 = 2
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == COMMA )
        alt_6 = 1
      end
      case alt_6
      when 1
        # at line 78:201: mat_dim
        @state.following.push( TOKENS_FOLLOWING_mat_dim_IN_dim_dec_587 )
        mat_dim
        @state.following.pop

      end
      match( RKEY, TOKENS_FOLLOWING_RKEY_IN_dim_dec_592 )

      # --> action
       $dim.calculate_m(__ID1__.text) 
      # <-- action

      match( SEMI, TOKENS_FOLLOWING_SEMI_IN_dim_dec_596 )

      # --> action
       $dim.reset_r()
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )


      end

      return 
    end



    #
    # parser rule mat_dim
    #
    # (in FoodLOOP.g)
    # 80:1: mat_dim : COMMA NUM_I ;
    #
    def mat_dim
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      __NUM_I4__ = nil


      begin
      # at line 80:10: COMMA NUM_I
      match( COMMA, TOKENS_FOLLOWING_COMMA_IN_mat_dim_605 )

      # --> action
       $dim.new_dimension($dim_aux) 
      # <-- action

      __NUM_I4__ = match( NUM_I, TOKENS_FOLLOWING_NUM_I_IN_mat_dim_609 )

      # --> action
       $dim.add_limit($dim_aux, __NUM_I4__.text) 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )


      end

      return 
    end



    #
    # parser rule dim_obj
    #
    # (in FoodLOOP.g)
    # 82:1: dim_obj : LKEY exp ( COMMA exp )? RKEY ;
    #
    def dim_obj
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      begin
      # at line 82:10: LKEY exp ( COMMA exp )? RKEY
      match( LKEY, TOKENS_FOLLOWING_LKEY_IN_dim_obj_618 )

      # --> action
       $quads.has_dim() 
      # <-- action

      @state.following.push( TOKENS_FOLLOWING_exp_IN_dim_obj_622 )
      exp
      @state.following.pop

      # --> action
       $quads.generate_limit_quad() 
      # <-- action

      # at line 82:75: ( COMMA exp )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == COMMA )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 82:77: COMMA exp
        match( COMMA, TOKENS_FOLLOWING_COMMA_IN_dim_obj_628 )

        # --> action
         $quads.update_dim() 
        # <-- action

        @state.following.push( TOKENS_FOLLOWING_exp_IN_dim_obj_632 )
        exp
        @state.following.pop

        # --> action
         $quads.generate_limit_quad() 
        # <-- action


      end
      match( RKEY, TOKENS_FOLLOWING_RKEY_IN_dim_obj_639 )

      # --> action
       $quads.generate_dim_quads() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )


      end

      return 
    end



    #
    # parser rule var_dec
    #
    # (in FoodLOOP.g)
    # 84:1: var_dec : VAR ID DDOT type ( EQUAL ( mega_expression | input ) )? SEMI ;
    #
    def var_dec
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      __ID5__ = nil
      __EQUAL7__ = nil
      type6 = nil


      begin
      # at line 84:10: VAR ID DDOT type ( EQUAL ( mega_expression | input ) )? SEMI
      match( VAR, TOKENS_FOLLOWING_VAR_IN_var_dec_648 )
      __ID5__ = match( ID, TOKENS_FOLLOWING_ID_IN_var_dec_650 )

      # --> action
       $assgn_aux = __ID5__.text
      # <-- action

      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_var_dec_654 )
      @state.following.push( TOKENS_FOLLOWING_type_IN_var_dec_656 )
      type6 = type
      @state.following.pop

      # --> action
       $manager.add_variable(__ID5__.text, ( type6 && @input.to_s( type6.start, type6.stop ) )) 
      # <-- action

      # at line 84:102: ( EQUAL ( mega_expression | input ) )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == EQUAL )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 84:104: EQUAL ( mega_expression | input )
        __EQUAL7__ = match( EQUAL, TOKENS_FOLLOWING_EQUAL_IN_var_dec_662 )

        # --> action
         $quads.add_id(__ID5__.text, nil) 
        # <-- action


        # --> action
         $quads.add_operator(__EQUAL7__.text) 
        # <-- action

        # at line 84:182: ( mega_expression | input )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == BOOL || look_8_0 == ID || look_8_0 == LPAREN || look_8_0.between?( NUM_F, NUM_I ) || look_8_0 == WORD )
          alt_8 = 1
        elsif ( look_8_0 == INPUT )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )

        end
        case alt_8
        when 1
          # at line 84:184: mega_expression
          @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_var_dec_670 )
          mega_expression
          @state.following.pop

          # --> action
           $quads.assign_quad() 
          # <-- action


        when 2
          # at line 84:229: input
          @state.following.push( TOKENS_FOLLOWING_input_IN_var_dec_677 )
          input
          @state.following.pop

          # --> action
           $quads.assign_read() 
          # <-- action


        end

      end
      match( SEMI, TOKENS_FOLLOWING_SEMI_IN_var_dec_686 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )


      end

      return 
    end



    #
    # parser rule cte_dec
    #
    # (in FoodLOOP.g)
    # 86:1: cte_dec : CTE ID DDOT type ( EQUAL ( mega_expression ) ) SEMI ;
    #
    def cte_dec
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      __ID8__ = nil
      __EQUAL10__ = nil
      type9 = nil


      begin
      # at line 86:10: CTE ID DDOT type ( EQUAL ( mega_expression ) ) SEMI
      match( CTE, TOKENS_FOLLOWING_CTE_IN_cte_dec_693 )
      __ID8__ = match( ID, TOKENS_FOLLOWING_ID_IN_cte_dec_695 )

      # --> action
       $assgn_aux = __ID8__.text
      # <-- action

      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_cte_dec_699 )
      @state.following.push( TOKENS_FOLLOWING_type_IN_cte_dec_701 )
      type9 = type
      @state.following.pop

      # --> action
       $manager.add_constant(__ID8__.text, ( type9 && @input.to_s( type9.start, type9.stop ) )) 
      # <-- action

      # at line 86:102: ( EQUAL ( mega_expression ) )
      # at line 86:104: EQUAL ( mega_expression )
      __EQUAL10__ = match( EQUAL, TOKENS_FOLLOWING_EQUAL_IN_cte_dec_707 )

      # --> action
       $quads.add_id(__ID8__.text, nil) 
      # <-- action


      # --> action
       $quads.add_operator(__EQUAL10__.text) 
      # <-- action

      # at line 86:182: ( mega_expression )
      # at line 86:184: mega_expression
      @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_cte_dec_715 )
      mega_expression
      @state.following.pop

      # --> action
       $quads.assign_quad() 
      # <-- action



      match( SEMI, TOKENS_FOLLOWING_SEMI_IN_cte_dec_724 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )


      end

      return 
    end



    #
    # parser rule assignment
    #
    # (in FoodLOOP.g)
    # 88:1: assignment : ID ( dim_obj )? ( EQUAL ( mega_expression | input ) ) SEMI ;
    #
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      __ID11__ = nil
      __EQUAL12__ = nil


      begin
      # at line 88:13: ID ( dim_obj )? ( EQUAL ( mega_expression | input ) ) SEMI
      __ID11__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_731 )

      # --> action
       $assgn_aux = __ID11__.text
      # <-- action


      # --> action
       $quads.variable_exists?(__ID11__.text) 
      # <-- action


      # --> action
       $quads.add_id(__ID11__.text, nil) 
      # <-- action

      # at line 88:115: ( dim_obj )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == LKEY )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 88:117: dim_obj
        # --> action
         $dim_aux = __ID11__.text 
        # <-- action

        @state.following.push( TOKENS_FOLLOWING_dim_obj_IN_assignment_743 )
        dim_obj
        @state.following.pop

      end

      # --> action
       $quads.check_dim(__ID11__.text) 
      # <-- action

      # at line 88:186: ( EQUAL ( mega_expression | input ) )
      # at line 88:188: EQUAL ( mega_expression | input )
      __EQUAL12__ = match( EQUAL, TOKENS_FOLLOWING_EQUAL_IN_assignment_753 )

      # --> action
       $quads.add_operator(__EQUAL12__.text) 
      # <-- action

      # at line 88:233: ( mega_expression | input )
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == BOOL || look_11_0 == ID || look_11_0 == LPAREN || look_11_0.between?( NUM_F, NUM_I ) || look_11_0 == WORD )
        alt_11 = 1
      elsif ( look_11_0 == INPUT )
        alt_11 = 2
      else
        raise NoViableAlternative( "", 11, 0 )

      end
      case alt_11
      when 1
        # at line 88:235: mega_expression
        @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_assignment_760 )
        mega_expression
        @state.following.pop

        # --> action
         $quads.assign_quad() 
        # <-- action


      when 2
        # at line 88:279: input
        @state.following.push( TOKENS_FOLLOWING_input_IN_assignment_766 )
        input
        @state.following.pop

        # --> action
         $quads.assign_read() 
        # <-- action


      end

      match( SEMI, TOKENS_FOLLOWING_SEMI_IN_assignment_774 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )


      end

      return 
    end



    #
    # parser rule condition
    #
    # (in FoodLOOP.g)
    # 90:1: condition : IF LPAREN mega_expression RPAREN DDOT ( estatute )* ( ELSE block | FIN ) IF ;
    #
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      begin
      # at line 90:12: IF LPAREN mega_expression RPAREN DDOT ( estatute )* ( ELSE block | FIN ) IF
      match( IF, TOKENS_FOLLOWING_IF_IN_condition_781 )
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_783 )
      @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_condition_785 )
      mega_expression
      @state.following.pop
      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_787 )

      # --> action
       $quads.gotof() 
      # <-- action

      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_condition_791 )
      # at line 90:70: ( estatute )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0.between?( ID, IF ) || look_12_0 == PRINT || look_12_0 == WHILE )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 90:72: estatute
          @state.following.push( TOKENS_FOLLOWING_estatute_IN_condition_795 )
          estatute
          @state.following.pop

        else
          break # out of loop for decision 12
        end
      end # loop for decision 12

      # at line 90:84: ( ELSE block | FIN )
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == ELSE )
        alt_13 = 1
      elsif ( look_13_0 == FIN )
        alt_13 = 2
      else
        raise NoViableAlternative( "", 13, 0 )

      end
      case alt_13
      when 1
        # at line 90:86: ELSE block
        match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_802 )

        # --> action
         $quads.goto() 
        # <-- action

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_806 )
        block
        @state.following.pop

      when 2
        # at line 90:118: FIN
        match( FIN, TOKENS_FOLLOWING_FIN_IN_condition_810 )

      end

      # --> action
       $quads.fill_main_quad() 
      # <-- action

      match( IF, TOKENS_FOLLOWING_IF_IN_condition_816 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )


      end

      return 
    end



    #
    # parser rule while_loop
    #
    # (in FoodLOOP.g)
    # 92:1: while_loop : WHILE LPAREN mega_expression RPAREN block WHILE ;
    #
    def while_loop
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      begin
      # at line 92:13: WHILE LPAREN mega_expression RPAREN block WHILE
      match( WHILE, TOKENS_FOLLOWING_WHILE_IN_while_loop_823 )

      # --> action
       $quads.add_jump() 
      # <-- action

      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_while_loop_827 )
      @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_while_loop_829 )
      mega_expression
      @state.following.pop
      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_while_loop_831 )

      # --> action
       $quads.gotof() 
      # <-- action

      @state.following.push( TOKENS_FOLLOWING_block_IN_while_loop_835 )
      block
      @state.following.pop
      match( WHILE, TOKENS_FOLLOWING_WHILE_IN_while_loop_837 )

      # --> action
       $quads.goto_while() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )


      end

      return 
    end



    #
    # parser rule input
    #
    # (in FoodLOOP.g)
    # 94:1: input : INPUT LPAREN RPAREN ;
    #
    def input
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      begin
      # at line 94:8: INPUT LPAREN RPAREN
      match( INPUT, TOKENS_FOLLOWING_INPUT_IN_input_846 )
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_input_848 )

      # --> action
       $quads.read($assgn_aux) 
      # <-- action

      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_input_852 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )


      end

      return 
    end



    #
    # parser rule output
    #
    # (in FoodLOOP.g)
    # 96:1: output : PRINT LPAREN mega_expression RPAREN SEMI ;
    #
    def output
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      begin
      # at line 96:9: PRINT LPAREN mega_expression RPAREN SEMI
      match( PRINT, TOKENS_FOLLOWING_PRINT_IN_output_859 )
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_output_861 )
      @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_output_863 )
      mega_expression
      @state.following.pop
      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_output_865 )

      # --> action
       $quads.write() 
      # <-- action

      match( SEMI, TOKENS_FOLLOWING_SEMI_IN_output_869 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )


      end

      return 
    end

    ParametersReturnValue = define_return_scope

    #
    # parser rule parameters
    #
    # (in FoodLOOP.g)
    # 98:1: parameters : LPAREN ( type ID ( COMMA type ID )* )? RPAREN ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      begin
      # at line 98:13: LPAREN ( type ID ( COMMA type ID )* )? RPAREN
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_parameters_876 )
      # at line 98:20: ( type ID ( COMMA type ID )* )?
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == BOOLEAN || look_15_0 == FLOAT || look_15_0 == ID || look_15_0 == INTEGER || look_15_0 == STRING || look_15_0 == VOID )
        alt_15 = 1
      end
      case alt_15
      when 1
        # at line 98:22: type ID ( COMMA type ID )*
        @state.following.push( TOKENS_FOLLOWING_type_IN_parameters_880 )
        type
        @state.following.pop
        match( ID, TOKENS_FOLLOWING_ID_IN_parameters_882 )
        # at line 98:30: ( COMMA type ID )*
        while true # decision 14
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == COMMA )
            alt_14 = 1

          end
          case alt_14
          when 1
            # at line 98:32: COMMA type ID
            match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_886 )
            @state.following.push( TOKENS_FOLLOWING_type_IN_parameters_888 )
            type
            @state.following.pop
            match( ID, TOKENS_FOLLOWING_ID_IN_parameters_890 )

          else
            break # out of loop for decision 14
          end
        end # loop for decision 14


      end
      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_parameters_898 )

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )


      end

      return return_value
    end



    #
    # parser rule function
    #
    # (in FoodLOOP.g)
    # 100:1: function : FUNCTION ( type ) ID parameters DDOT ( estatute | var_dec | dim_dec | comments )* ( RETURN mega_expression SEMI )? FIN FUNCTION ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      __ID13__ = nil
      parameters14 = nil
      type15 = nil


      begin
      # at line 100:11: FUNCTION ( type ) ID parameters DDOT ( estatute | var_dec | dim_dec | comments )* ( RETURN mega_expression SEMI )? FIN FUNCTION
      match( FUNCTION, TOKENS_FOLLOWING_FUNCTION_IN_function_905 )
      # at line 100:20: ( type )
      # at line 100:22: type
      @state.following.push( TOKENS_FOLLOWING_type_IN_function_909 )
      type15 = type
      @state.following.pop

      __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_function_913 )
      @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_915 )
      parameters14 = parameters
      @state.following.pop
      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_function_917 )

      # --> action
       $manager.add_function(__ID13__.text, ( parameters14 && @input.to_s( parameters14.start, parameters14.stop ) ), ( type15 && @input.to_s( type15.start, type15.stop ) ))
      # <-- action

      # at line 100:114: ( estatute | var_dec | dim_dec | comments )*
      while true # decision 16
        alt_16 = 5
        case look_16 = @input.peek( 1 )
        when ID, IF, PRINT, WHILE then alt_16 = 1
        when VAR then look_16_3 = @input.peek( 2 )

        if ( look_16_3 == ID )
          look_16_5 = @input.peek( 3 )

          if ( look_16_5 == DDOT )
            look_16_6 = @input.peek( 4 )

            if ( look_16_6 == BOOLEAN || look_16_6 == FLOAT || look_16_6 == ID || look_16_6 == INTEGER || look_16_6 == STRING || look_16_6 == VOID )
              look_16_7 = @input.peek( 5 )

              if ( look_16_7 == EQUAL || look_16_7 == SEMI )
                alt_16 = 2
              elsif ( look_16_7 == LKEY )
                alt_16 = 3

              end

            end

          end

        end
        when DIV then alt_16 = 4
        end
        case alt_16
        when 1
          # at line 100:116: estatute
          @state.following.push( TOKENS_FOLLOWING_estatute_IN_function_923 )
          estatute
          @state.following.pop

        when 2
          # at line 100:127: var_dec
          @state.following.push( TOKENS_FOLLOWING_var_dec_IN_function_927 )
          var_dec
          @state.following.pop

        when 3
          # at line 100:137: dim_dec
          @state.following.push( TOKENS_FOLLOWING_dim_dec_IN_function_931 )
          dim_dec
          @state.following.pop

        when 4
          # at line 100:147: comments
          @state.following.push( TOKENS_FOLLOWING_comments_IN_function_935 )
          comments
          @state.following.pop

        else
          break # out of loop for decision 16
        end
      end # loop for decision 16

      # at line 100:158: ( RETURN mega_expression SEMI )?
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == RETURN )
        alt_17 = 1
      end
      case alt_17
      when 1
        # at line 100:160: RETURN mega_expression SEMI
        match( RETURN, TOKENS_FOLLOWING_RETURN_IN_function_941 )
        @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_function_943 )
        mega_expression
        @state.following.pop

        # --> action
         $quads.return(__ID13__.text) 
        # <-- action

        match( SEMI, TOKENS_FOLLOWING_SEMI_IN_function_947 )

      end
      match( FIN, TOKENS_FOLLOWING_FIN_IN_function_952 )
      match( FUNCTION, TOKENS_FOLLOWING_FUNCTION_IN_function_954 )

      # --> action
       $quads.end_function() 
      # <-- action


      # --> action
       $manager.reset_context() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )


      end

      return 
    end



    #
    # parser rule block
    #
    # (in FoodLOOP.g)
    # 102:1: block : DDOT ( estatute )* FIN ;
    #
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      begin
      # at line 102:8: DDOT ( estatute )* FIN
      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_block_965 )
      # at line 102:13: ( estatute )*
      while true # decision 18
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0.between?( ID, IF ) || look_18_0 == PRINT || look_18_0 == WHILE )
          alt_18 = 1

        end
        case alt_18
        when 1
          # at line 102:15: estatute
          @state.following.push( TOKENS_FOLLOWING_estatute_IN_block_969 )
          estatute
          @state.following.pop

        else
          break # out of loop for decision 18
        end
      end # loop for decision 18

      match( FIN, TOKENS_FOLLOWING_FIN_IN_block_975 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )


      end

      return 
    end



    #
    # parser rule func_call
    #
    # (in FoodLOOP.g)
    # 104:1: func_call : ID func_call_parameters ;
    #
    def func_call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      __ID16__ = nil


      begin
      # at line 104:12: ID func_call_parameters
      __ID16__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_call_982 )

      # --> action
       $quads.function_exists?(__ID16__.text) 
      # <-- action


      # --> action
       $func_aux = __ID16__.text 
      # <-- action


      # --> action
       $quads.era(__ID16__.text) 
      # <-- action

      @state.following.push( TOKENS_FOLLOWING_func_call_parameters_IN_func_call_990 )
      func_call_parameters
      @state.following.pop

      # --> action
       $quads.get_return_value() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )


      end

      return 
    end



    #
    # parser rule func_call_parameters
    #
    # (in FoodLOOP.g)
    # 106:1: func_call_parameters : LPAREN ( ( mega_expression ) ( COMMA ( mega_expression ) )* )? RPAREN ;
    #
    def func_call_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      begin
      # at line 106:23: LPAREN ( ( mega_expression ) ( COMMA ( mega_expression ) )* )? RPAREN
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_func_call_parameters_999 )
      # at line 106:30: ( ( mega_expression ) ( COMMA ( mega_expression ) )* )?
      alt_20 = 2
      look_20_0 = @input.peek( 1 )

      if ( look_20_0 == BOOL || look_20_0 == ID || look_20_0 == LPAREN || look_20_0.between?( NUM_F, NUM_I ) || look_20_0 == WORD )
        alt_20 = 1
      end
      case alt_20
      when 1
        # at line 106:32: ( mega_expression ) ( COMMA ( mega_expression ) )*
        # at line 106:32: ( mega_expression )
        # at line 106:34: mega_expression
        @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_func_call_parameters_1005 )
        mega_expression
        @state.following.pop


        # --> action
         $quads.parameter($func_aux) 
        # <-- action

        # at line 106:86: ( COMMA ( mega_expression ) )*
        while true # decision 19
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == COMMA )
            alt_19 = 1

          end
          case alt_19
          when 1
            # at line 106:88: COMMA ( mega_expression )
            match( COMMA, TOKENS_FOLLOWING_COMMA_IN_func_call_parameters_1013 )
            # at line 106:94: ( mega_expression )
            # at line 106:96: mega_expression
            @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_func_call_parameters_1017 )
            mega_expression
            @state.following.pop


            # --> action
             $quads.parameter($func_aux) 
            # <-- action


          else
            break # out of loop for decision 19
          end
        end # loop for decision 19


      end

      # --> action
       $quads.verify_func_param_count($func_aux) 
      # <-- action

      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_func_call_parameters_1033 )

      # --> action
       $quads.go_sub($func_aux) 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )


      end

      return 
    end



    #
    # parser rule mega_expression
    #
    # (in FoodLOOP.g)
    # 108:1: mega_expression : super_expression ( ( AND | OR ) super_expression )? ;
    #
    def mega_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      __AND17__ = nil
      __OR18__ = nil


      begin
      # at line 108:18: super_expression ( ( AND | OR ) super_expression )?
      @state.following.push( TOKENS_FOLLOWING_super_expression_IN_mega_expression_1042 )
      super_expression
      @state.following.pop
      # at line 108:35: ( ( AND | OR ) super_expression )?
      alt_22 = 2
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == AND || look_22_0 == OR )
        alt_22 = 1
      end
      case alt_22
      when 1
        # at line 108:36: ( AND | OR ) super_expression
        # at line 108:36: ( AND | OR )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == AND )
          alt_21 = 1
        elsif ( look_21_0 == OR )
          alt_21 = 2
        else
          raise NoViableAlternative( "", 21, 0 )

        end
        case alt_21
        when 1
          # at line 108:37: AND
          __AND17__ = match( AND, TOKENS_FOLLOWING_AND_IN_mega_expression_1046 )

          # --> action
           $quads.add_operator(__AND17__.text) 
          # <-- action


        when 2
          # at line 108:80: OR
          __OR18__ = match( OR, TOKENS_FOLLOWING_OR_IN_mega_expression_1053 )

          # --> action
           $quads.add_operator(__OR18__.text) 
          # <-- action


        end
        @state.following.push( TOKENS_FOLLOWING_super_expression_IN_mega_expression_1059 )
        super_expression
        @state.following.pop

        # --> action
         $quads.is_mega_expression_pending() 
        # <-- action


      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )


      end

      return 
    end



    #
    # parser rule super_expression
    #
    # (in FoodLOOP.g)
    # 110:1: super_expression : exp ( ( GT | GTE | LT | LTE | DIF | SIMILAR ) exp )? ;
    #
    def super_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      __GT19__ = nil
      __GTE20__ = nil
      __LT21__ = nil
      __LTE22__ = nil
      __DIF23__ = nil
      __SIMILAR24__ = nil


      begin
      # at line 110:19: exp ( ( GT | GTE | LT | LTE | DIF | SIMILAR ) exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_super_expression_1071 )
      exp
      @state.following.pop
      # at line 110:23: ( ( GT | GTE | LT | LTE | DIF | SIMILAR ) exp )?
      alt_24 = 2
      look_24_0 = @input.peek( 1 )

      if ( look_24_0 == DIF || look_24_0.between?( GT, GTE ) || look_24_0.between?( LT, LTE ) || look_24_0 == SIMILAR )
        alt_24 = 1
      end
      case alt_24
      when 1
        # at line 110:25: ( GT | GTE | LT | LTE | DIF | SIMILAR ) exp
        # at line 110:25: ( GT | GTE | LT | LTE | DIF | SIMILAR )
        alt_23 = 6
        case look_23 = @input.peek( 1 )
        when GT then alt_23 = 1
        when GTE then alt_23 = 2
        when LT then alt_23 = 3
        when LTE then alt_23 = 4
        when DIF then alt_23 = 5
        when SIMILAR then alt_23 = 6
        else
          raise NoViableAlternative( "", 23, 0 )

        end
        case alt_23
        when 1
          # at line 110:27: GT
          __GT19__ = match( GT, TOKENS_FOLLOWING_GT_IN_super_expression_1077 )

          # --> action
           $quads.add_operator(__GT19__.text) 
          # <-- action


        when 2
          # at line 110:67: GTE
          __GTE20__ = match( GTE, TOKENS_FOLLOWING_GTE_IN_super_expression_1083 )

          # --> action
           $quads.add_operator(__GTE20__.text) 
          # <-- action


        when 3
          # at line 110:108: LT
          __LT21__ = match( LT, TOKENS_FOLLOWING_LT_IN_super_expression_1088 )

          # --> action
           $quads.add_operator(__LT21__.text) 
          # <-- action


        when 4
          # at line 110:147: LTE
          __LTE22__ = match( LTE, TOKENS_FOLLOWING_LTE_IN_super_expression_1093 )

          # --> action
           $quads.add_operator(__LTE22__.text) 
          # <-- action


        when 5
          # at line 110:188: DIF
          __DIF23__ = match( DIF, TOKENS_FOLLOWING_DIF_IN_super_expression_1098 )

          # --> action
           $quads.add_operator(__DIF23__.text) 
          # <-- action


        when 6
          # at line 110:229: SIMILAR
          __SIMILAR24__ = match( SIMILAR, TOKENS_FOLLOWING_SIMILAR_IN_super_expression_1103 )

          # --> action
           $quads.add_operator(__SIMILAR24__.text) 
          # <-- action


        end
        @state.following.push( TOKENS_FOLLOWING_exp_IN_super_expression_1110 )
        exp
        @state.following.pop

        # --> action
         $quads.is_super_expression_pending() 
        # <-- action


      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )


      end

      return 
    end



    #
    # parser rule exp
    #
    # (in FoodLOOP.g)
    # 112:1: exp : term ( ( PLUS | SUB ) term )* ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      __PLUS25__ = nil
      __SUB26__ = nil


      begin
      # at line 112:6: term ( ( PLUS | SUB ) term )*
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_1122 )
      term
      @state.following.pop
      # at line 112:11: ( ( PLUS | SUB ) term )*
      while true # decision 26
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == PLUS || look_26_0 == SUB )
          alt_26 = 1

        end
        case alt_26
        when 1
          # at line 112:12: ( PLUS | SUB ) term
          # at line 112:12: ( PLUS | SUB )
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == PLUS )
            alt_25 = 1
          elsif ( look_25_0 == SUB )
            alt_25 = 2
          else
            raise NoViableAlternative( "", 25, 0 )

          end
          case alt_25
          when 1
            # at line 112:13: PLUS
            __PLUS25__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_exp_1126 )

            # --> action
             $quads.add_operator(__PLUS25__.text) 
            # <-- action


          when 2
            # at line 112:58: SUB
            __SUB26__ = match( SUB, TOKENS_FOLLOWING_SUB_IN_exp_1133 )

            # --> action
             $quads.add_operator(__SUB26__.text) 
            # <-- action


          end
          @state.following.push( TOKENS_FOLLOWING_term_IN_exp_1140 )
          term
          @state.following.pop

          # --> action
           $quads.is_exp_pending() 
          # <-- action


        else
          break # out of loop for decision 26
        end
      end # loop for decision 26


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )


      end

      return 
    end



    #
    # parser rule term
    #
    # (in FoodLOOP.g)
    # 114:1: term : factor ( ( MUL | DIV ) factor )* ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      __MUL27__ = nil
      __DIV28__ = nil


      begin
      # at line 114:7: factor ( ( MUL | DIV ) factor )*
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_1152 )
      factor
      @state.following.pop
      # at line 114:14: ( ( MUL | DIV ) factor )*
      while true # decision 28
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == DIV || look_28_0 == MUL )
          alt_28 = 1

        end
        case alt_28
        when 1
          # at line 114:16: ( MUL | DIV ) factor
          # at line 114:16: ( MUL | DIV )
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == MUL )
            alt_27 = 1
          elsif ( look_27_0 == DIV )
            alt_27 = 2
          else
            raise NoViableAlternative( "", 27, 0 )

          end
          case alt_27
          when 1
            # at line 114:18: MUL
            __MUL27__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_term_1158 )

            # --> action
             $quads.add_operator(__MUL27__.text) 
            # <-- action


          when 2
            # at line 114:60: DIV
            __DIV28__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_term_1164 )

            # --> action
             $quads.add_operator(__DIV28__.text) 
            # <-- action


          end
          @state.following.push( TOKENS_FOLLOWING_factor_IN_term_1170 )
          factor
          @state.following.pop

          # --> action
           $quads.is_term_pending() 
          # <-- action


        else
          break # out of loop for decision 28
        end
      end # loop for decision 28


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )


      end

      return 
    end



    #
    # parser rule factor
    #
    # (in FoodLOOP.g)
    # 116:1: factor : ( ID ( dim_obj )? | LPAREN mega_expression RPAREN | value | func_call | method_call );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      __ID29__ = nil
      __LPAREN30__ = nil
      value31 = nil


      begin
      # at line 116:7: ( ID ( dim_obj )? | LPAREN mega_expression RPAREN | value | func_call | method_call )
      alt_30 = 5
      case look_30 = @input.peek( 1 )
      when ID then case look_30 = @input.peek( 2 )
      when AND, COMMA, DIF, DIV, GT, GTE, LKEY, LT, LTE, MUL, OR, PLUS, RKEY, RPAREN, SEMI, SIMILAR, SUB then alt_30 = 1
      when LPAREN then alt_30 = 4
      when DOT then alt_30 = 5
      else
        raise NoViableAlternative( "", 30, 1 )

      end
      when LPAREN then alt_30 = 2
      when BOOL, NUM_F, NUM_I, WORD then alt_30 = 3
      else
        raise NoViableAlternative( "", 30, 0 )

      end
      case alt_30
      when 1
        # at line 116:9: ID ( dim_obj )?
        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_factor_1182 )

        # --> action
         $quads.add_id(__ID29__.text, nil) 
        # <-- action

        # at line 116:46: ( dim_obj )?
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == LKEY )
          alt_29 = 1
        end
        case alt_29
        when 1
          # at line 116:48: dim_obj
          # --> action
           $dim_aux = __ID29__.text 
          # <-- action

          @state.following.push( TOKENS_FOLLOWING_dim_obj_IN_factor_1190 )
          dim_obj
          @state.following.pop

        end

        # --> action
         $quads.check_dim(__ID29__.text) 
        # <-- action


      when 2
        # at line 116:118: LPAREN mega_expression RPAREN
        __LPAREN30__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1199 )

        # --> action
         $quads.add_false_bottom(__LPAREN30__.text) 
        # <-- action

        @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_factor_1203 )
        mega_expression
        @state.following.pop
        match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1205 )

        # --> action
         $quads.remove_false_bottom() 
        # <-- action


      when 3
        # at line 116:227: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_factor_1211 )
        value31 = value
        @state.following.pop

        # --> action
         $quads.add_id(nil, ( value31 && @input.to_s( value31.start, value31.stop ) )) 
        # <-- action


      when 4
        # at line 116:272: func_call
        @state.following.push( TOKENS_FOLLOWING_func_call_IN_factor_1217 )
        func_call
        @state.following.pop

      when 5
        # at line 116:284: method_call
        @state.following.push( TOKENS_FOLLOWING_method_call_IN_factor_1221 )
        method_call
        @state.following.pop

      end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )


      end

      return 
    end

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in FoodLOOP.g)
    # 118:1: type : ( STRING | BOOLEAN | FLOAT | INTEGER | VOID | ID );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      begin
      # at line 
      if @input.peek(1) == BOOLEAN || @input.peek(1) == FLOAT || @input.peek(1) == ID || @input.peek(1) == INTEGER || @input.peek(1) == STRING || @input.peek(1) == VOID
        @input.consume
        @state.error_recovery = false

      else
        mse = MismatchedSet( nil )
        raise mse

      end



      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )


      end

      return return_value
    end

    ValueReturnValue = define_return_scope

    #
    # parser rule value
    #
    # (in FoodLOOP.g)
    # 120:1: value : ( WORD | NUM_F | NUM_I | BOOL );
    #
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      begin
      # at line 
      if @input.peek(1) == BOOL || @input.peek( 1 ).between?( NUM_F, NUM_I ) || @input.peek(1) == WORD
        @input.consume
        @state.error_recovery = false

      else
        mse = MismatchedSet( nil )
        raise mse

      end



      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )


      end

      return return_value
    end



    #
    # parser rule food_class
    #
    # (in FoodLOOP.g)
    # 122:1: food_class : CLASS ID ( inherits )? DDOT ( function | dim_dec | var_dec | comments )* FIN CLASS ;
    #
    def food_class
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      __ID32__ = nil


      begin
      # at line 122:13: CLASS ID ( inherits )? DDOT ( function | dim_dec | var_dec | comments )* FIN CLASS
      match( CLASS, TOKENS_FOLLOWING_CLASS_IN_food_class_1274 )
      __ID32__ = match( ID, TOKENS_FOLLOWING_ID_IN_food_class_1276 )

      # --> action
       $class_aux = __ID32__.text 
      # <-- action


      # --> action
       $manager.add_class(__ID32__.text, nil) 
      # <-- action

      # at line 122:88: ( inherits )?
      alt_31 = 2
      look_31_0 = @input.peek( 1 )

      if ( look_31_0 == INHERITS )
        alt_31 = 1
      end
      case alt_31
      when 1
        # at line 122:88: inherits
        @state.following.push( TOKENS_FOLLOWING_inherits_IN_food_class_1282 )
        inherits
        @state.following.pop

      end
      match( DDOT, TOKENS_FOLLOWING_DDOT_IN_food_class_1286 )
      # at line 122:104: ( function | dim_dec | var_dec | comments )*
      while true # decision 32
        alt_32 = 5
        case look_32 = @input.peek( 1 )
        when FUNCTION then alt_32 = 1
        when VAR then look_32_3 = @input.peek( 2 )

        if ( look_32_3 == ID )
          look_32_5 = @input.peek( 3 )

          if ( look_32_5 == DDOT )
            look_32_6 = @input.peek( 4 )

            if ( look_32_6 == BOOLEAN || look_32_6 == FLOAT || look_32_6 == ID || look_32_6 == INTEGER || look_32_6 == STRING || look_32_6 == VOID )
              look_32_7 = @input.peek( 5 )

              if ( look_32_7 == LKEY )
                alt_32 = 2
              elsif ( look_32_7 == EQUAL || look_32_7 == SEMI )
                alt_32 = 3

              end

            end

          end

        end
        when DIV then alt_32 = 4
        end
        case alt_32
        when 1
          # at line 122:106: function
          @state.following.push( TOKENS_FOLLOWING_function_IN_food_class_1290 )
          function
          @state.following.pop

        when 2
          # at line 122:117: dim_dec
          @state.following.push( TOKENS_FOLLOWING_dim_dec_IN_food_class_1294 )
          dim_dec
          @state.following.pop

        when 3
          # at line 122:127: var_dec
          @state.following.push( TOKENS_FOLLOWING_var_dec_IN_food_class_1298 )
          var_dec
          @state.following.pop

        when 4
          # at line 122:137: comments
          @state.following.push( TOKENS_FOLLOWING_comments_IN_food_class_1302 )
          comments
          @state.following.pop

        else
          break # out of loop for decision 32
        end
      end # loop for decision 32

      match( FIN, TOKENS_FOLLOWING_FIN_IN_food_class_1307 )
      match( CLASS, TOKENS_FOLLOWING_CLASS_IN_food_class_1309 )

      # --> action
       $manager.reset_class_context() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )


      end

      return 
    end



    #
    # parser rule inherits
    #
    # (in FoodLOOP.g)
    # 124:1: inherits : ( INHERITS ID ) ;
    #
    def inherits
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      __ID33__ = nil


      begin
      # at line 124:11: ( INHERITS ID )
      # at line 124:11: ( INHERITS ID )
      # at line 124:13: INHERITS ID
      match( INHERITS, TOKENS_FOLLOWING_INHERITS_IN_inherits_1320 )
      __ID33__ = match( ID, TOKENS_FOLLOWING_ID_IN_inherits_1322 )


      # --> action
       $manager.main_context.class_directories.classes[$class_aux].inherits_of = __ID33__.text 
      # <-- action


      # --> action
       $manager.inherits_class_context(__ID33__.text) 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )


      end

      return 
    end



    #
    # parser rule method_call
    #
    # (in FoodLOOP.g)
    # 126:1: method_call : ID DOT method_call_params ;
    #
    def method_call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      __ID34__ = nil


      begin
      # at line 126:14: ID DOT method_call_params
      __ID34__ = match( ID, TOKENS_FOLLOWING_ID_IN_method_call_1335 )

      # --> action
      $method_aux = __ID34__.text
      # <-- action

      match( DOT, TOKENS_FOLLOWING_DOT_IN_method_call_1339 )
      @state.following.push( TOKENS_FOLLOWING_method_call_params_IN_method_call_1341 )
      method_call_params
      @state.following.pop

      # --> action
       $quads.get_return_value() 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 28 )


      end

      return 
    end



    #
    # parser rule method_call_params
    #
    # (in FoodLOOP.g)
    # 128:1: method_call_params : ID method_call_parameters ;
    #
    def method_call_params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      __ID35__ = nil


      begin
      # at line 128:21: ID method_call_parameters
      __ID35__ = match( ID, TOKENS_FOLLOWING_ID_IN_method_call_params_1350 )

      # --> action
       $func_aux = __ID35__.text 
      # <-- action


      # --> action
       $quads.method_exists?($method_aux, __ID35__.text) 
      # <-- action


      # --> action
       $quads.era_method($method_aux, __ID35__.text) 
      # <-- action

      @state.following.push( TOKENS_FOLLOWING_method_call_parameters_IN_method_call_params_1358 )
      method_call_parameters
      @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 29 )


      end

      return 
    end



    #
    # parser rule method_call_parameters
    #
    # (in FoodLOOP.g)
    # 130:1: method_call_parameters : LPAREN ( ( mega_expression ) ( COMMA ( mega_expression ) )* )? RPAREN ;
    #
    def method_call_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      begin
      # at line 130:25: LPAREN ( ( mega_expression ) ( COMMA ( mega_expression ) )* )? RPAREN
      match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_method_call_parameters_1365 )
      # at line 130:32: ( ( mega_expression ) ( COMMA ( mega_expression ) )* )?
      alt_34 = 2
      look_34_0 = @input.peek( 1 )

      if ( look_34_0 == BOOL || look_34_0 == ID || look_34_0 == LPAREN || look_34_0.between?( NUM_F, NUM_I ) || look_34_0 == WORD )
        alt_34 = 1
      end
      case alt_34
      when 1
        # at line 130:34: ( mega_expression ) ( COMMA ( mega_expression ) )*
        # at line 130:34: ( mega_expression )
        # at line 130:36: mega_expression
        @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_method_call_parameters_1371 )
        mega_expression
        @state.following.pop


        # --> action
         $quads.method_parameter($method_aux ,$func_aux) 
        # <-- action

        # at line 130:109: ( COMMA ( mega_expression ) )*
        while true # decision 33
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == COMMA )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 130:111: COMMA ( mega_expression )
            match( COMMA, TOKENS_FOLLOWING_COMMA_IN_method_call_parameters_1379 )
            # at line 130:117: ( mega_expression )
            # at line 130:119: mega_expression
            @state.following.push( TOKENS_FOLLOWING_mega_expression_IN_method_call_parameters_1383 )
            mega_expression
            @state.following.pop


            # --> action
             $quads.method_parameter($method_aux ,$func_aux) 
            # <-- action


          else
            break # out of loop for decision 33
          end
        end # loop for decision 33


      end

      # --> action
       $quads.verify_method_param_count($method_aux ,$func_aux) 
      # <-- action

      match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_method_call_parameters_1397 )

      # --> action
       $quads.go_sub_method($method_aux, $func_aux) 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )


      end

      return 
    end



    #
    # parser rule comments
    #
    # (in FoodLOOP.g)
    # 132:1: comments : DIV WORD DIV ;
    #
    def comments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      begin
      # at line 132:11: DIV WORD DIV
      match( DIV, TOKENS_FOLLOWING_DIV_IN_comments_1406 )
      match( WORD, TOKENS_FOLLOWING_WORD_IN_comments_1408 )
      match( DIV, TOKENS_FOLLOWING_DIV_IN_comments_1410 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 31 )


      end

      return 
    end



    TOKENS_FOLLOWING_comments_IN_start_460 = Set[ 7, 12, 18, 36 ]
    TOKENS_FOLLOWING_food_class_IN_start_467 = Set[ 7, 18, 36 ]
    TOKENS_FOLLOWING_function_IN_start_475 = Set[ 18, 36 ]
    TOKENS_FOLLOWING_program_IN_start_481 = Set[ 1 ]
    TOKENS_FOLLOWING_PROGRAM_IN_program_492 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_program_496 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_program_498 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_estatute_IN_program_502 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_dim_dec_IN_program_506 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_var_dec_IN_program_510 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_cte_dec_IN_program_514 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_comments_IN_program_518 = Set[ 9, 12, 16, 21, 22, 35, 44, 46 ]
    TOKENS_FOLLOWING_FIN_IN_program_523 = Set[ 36 ]
    TOKENS_FOLLOWING_PROGRAM_IN_program_525 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_estatute_534 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_IN_estatute_538 = Set[ 1 ]
    TOKENS_FOLLOWING_output_IN_estatute_542 = Set[ 1 ]
    TOKENS_FOLLOWING_while_loop_IN_estatute_546 = Set[ 1 ]
    TOKENS_FOLLOWING_method_call_IN_estatute_550 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_estatute_552 = Set[ 1 ]
    TOKENS_FOLLOWING_func_call_IN_estatute_556 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_estatute_558 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_IN_dim_dec_565 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_dim_dec_567 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_dim_dec_571 = Set[ 6, 17, 21, 25, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_dim_dec_573 = Set[ 26 ]
    TOKENS_FOLLOWING_LKEY_IN_dim_dec_577 = Set[ 32 ]
    TOKENS_FOLLOWING_NUM_I_IN_dim_dec_581 = Set[ 8, 38 ]
    TOKENS_FOLLOWING_mat_dim_IN_dim_dec_587 = Set[ 38 ]
    TOKENS_FOLLOWING_RKEY_IN_dim_dec_592 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_dim_dec_596 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_mat_dim_605 = Set[ 32 ]
    TOKENS_FOLLOWING_NUM_I_IN_mat_dim_609 = Set[ 1 ]
    TOKENS_FOLLOWING_LKEY_IN_dim_obj_618 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_exp_IN_dim_obj_622 = Set[ 8, 38 ]
    TOKENS_FOLLOWING_COMMA_IN_dim_obj_628 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_exp_IN_dim_obj_632 = Set[ 38 ]
    TOKENS_FOLLOWING_RKEY_IN_dim_obj_639 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_IN_var_dec_648 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_var_dec_650 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_var_dec_654 = Set[ 6, 17, 21, 25, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_var_dec_656 = Set[ 15, 40 ]
    TOKENS_FOLLOWING_EQUAL_IN_var_dec_662 = Set[ 5, 21, 24, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_var_dec_670 = Set[ 40 ]
    TOKENS_FOLLOWING_input_IN_var_dec_677 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_var_dec_686 = Set[ 1 ]
    TOKENS_FOLLOWING_CTE_IN_cte_dec_693 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_cte_dec_695 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_cte_dec_699 = Set[ 6, 17, 21, 25, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_cte_dec_701 = Set[ 15 ]
    TOKENS_FOLLOWING_EQUAL_IN_cte_dec_707 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_cte_dec_715 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_cte_dec_724 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_731 = Set[ 15, 26 ]
    TOKENS_FOLLOWING_dim_obj_IN_assignment_743 = Set[ 15 ]
    TOKENS_FOLLOWING_EQUAL_IN_assignment_753 = Set[ 5, 21, 24, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_assignment_760 = Set[ 40 ]
    TOKENS_FOLLOWING_input_IN_assignment_766 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_assignment_774 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_781 = Set[ 27 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_783 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_condition_785 = Set[ 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_787 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_condition_791 = Set[ 14, 16, 21, 22, 35, 46 ]
    TOKENS_FOLLOWING_estatute_IN_condition_795 = Set[ 14, 16, 21, 22, 35, 46 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_802 = Set[ 10 ]
    TOKENS_FOLLOWING_block_IN_condition_806 = Set[ 22 ]
    TOKENS_FOLLOWING_FIN_IN_condition_810 = Set[ 22 ]
    TOKENS_FOLLOWING_IF_IN_condition_816 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_while_loop_823 = Set[ 27 ]
    TOKENS_FOLLOWING_LPAREN_IN_while_loop_827 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_while_loop_829 = Set[ 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_while_loop_831 = Set[ 10 ]
    TOKENS_FOLLOWING_block_IN_while_loop_835 = Set[ 46 ]
    TOKENS_FOLLOWING_WHILE_IN_while_loop_837 = Set[ 1 ]
    TOKENS_FOLLOWING_INPUT_IN_input_846 = Set[ 27 ]
    TOKENS_FOLLOWING_LPAREN_IN_input_848 = Set[ 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_input_852 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_output_859 = Set[ 27 ]
    TOKENS_FOLLOWING_LPAREN_IN_output_861 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_output_863 = Set[ 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_output_865 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_output_869 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_parameters_876 = Set[ 6, 17, 21, 25, 39, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_parameters_880 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_parameters_882 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_886 = Set[ 6, 17, 21, 25, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_parameters_888 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_parameters_890 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_parameters_898 = Set[ 1 ]
    TOKENS_FOLLOWING_FUNCTION_IN_function_905 = Set[ 6, 17, 21, 25, 42, 45 ]
    TOKENS_FOLLOWING_type_IN_function_909 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_function_913 = Set[ 27 ]
    TOKENS_FOLLOWING_parameters_IN_function_915 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_function_917 = Set[ 12, 16, 21, 22, 35, 37, 44, 46 ]
    TOKENS_FOLLOWING_estatute_IN_function_923 = Set[ 12, 16, 21, 22, 35, 37, 44, 46 ]
    TOKENS_FOLLOWING_var_dec_IN_function_927 = Set[ 12, 16, 21, 22, 35, 37, 44, 46 ]
    TOKENS_FOLLOWING_dim_dec_IN_function_931 = Set[ 12, 16, 21, 22, 35, 37, 44, 46 ]
    TOKENS_FOLLOWING_comments_IN_function_935 = Set[ 12, 16, 21, 22, 35, 37, 44, 46 ]
    TOKENS_FOLLOWING_RETURN_IN_function_941 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_function_943 = Set[ 40 ]
    TOKENS_FOLLOWING_SEMI_IN_function_947 = Set[ 16 ]
    TOKENS_FOLLOWING_FIN_IN_function_952 = Set[ 18 ]
    TOKENS_FOLLOWING_FUNCTION_IN_function_954 = Set[ 1 ]
    TOKENS_FOLLOWING_DDOT_IN_block_965 = Set[ 16, 21, 22, 35, 46 ]
    TOKENS_FOLLOWING_estatute_IN_block_969 = Set[ 16, 21, 22, 35, 46 ]
    TOKENS_FOLLOWING_FIN_IN_block_975 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_call_982 = Set[ 27 ]
    TOKENS_FOLLOWING_func_call_parameters_IN_func_call_990 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_func_call_parameters_999 = Set[ 5, 21, 27, 31, 32, 39, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_func_call_parameters_1005 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_COMMA_IN_func_call_parameters_1013 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_func_call_parameters_1017 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_func_call_parameters_1033 = Set[ 1 ]
    TOKENS_FOLLOWING_super_expression_IN_mega_expression_1042 = Set[ 1, 4, 33 ]
    TOKENS_FOLLOWING_AND_IN_mega_expression_1046 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_OR_IN_mega_expression_1053 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_super_expression_IN_mega_expression_1059 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_super_expression_1071 = Set[ 1, 11, 19, 20, 28, 29, 41 ]
    TOKENS_FOLLOWING_GT_IN_super_expression_1077 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_GTE_IN_super_expression_1083 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_LT_IN_super_expression_1088 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_LTE_IN_super_expression_1093 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_DIF_IN_super_expression_1098 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_SIMILAR_IN_super_expression_1103 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_exp_IN_super_expression_1110 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_1122 = Set[ 1, 34, 43 ]
    TOKENS_FOLLOWING_PLUS_IN_exp_1126 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_SUB_IN_exp_1133 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_term_IN_exp_1140 = Set[ 1, 34, 43 ]
    TOKENS_FOLLOWING_factor_IN_term_1152 = Set[ 1, 12, 30 ]
    TOKENS_FOLLOWING_MUL_IN_term_1158 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_DIV_IN_term_1164 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_factor_IN_term_1170 = Set[ 1, 12, 30 ]
    TOKENS_FOLLOWING_ID_IN_factor_1182 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_dim_obj_IN_factor_1190 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1199 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_factor_1203 = Set[ 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1205 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_factor_1211 = Set[ 1 ]
    TOKENS_FOLLOWING_func_call_IN_factor_1217 = Set[ 1 ]
    TOKENS_FOLLOWING_method_call_IN_factor_1221 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_food_class_1274 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_food_class_1276 = Set[ 10, 23 ]
    TOKENS_FOLLOWING_inherits_IN_food_class_1282 = Set[ 10 ]
    TOKENS_FOLLOWING_DDOT_IN_food_class_1286 = Set[ 12, 16, 18, 44 ]
    TOKENS_FOLLOWING_function_IN_food_class_1290 = Set[ 12, 16, 18, 44 ]
    TOKENS_FOLLOWING_dim_dec_IN_food_class_1294 = Set[ 12, 16, 18, 44 ]
    TOKENS_FOLLOWING_var_dec_IN_food_class_1298 = Set[ 12, 16, 18, 44 ]
    TOKENS_FOLLOWING_comments_IN_food_class_1302 = Set[ 12, 16, 18, 44 ]
    TOKENS_FOLLOWING_FIN_IN_food_class_1307 = Set[ 7 ]
    TOKENS_FOLLOWING_CLASS_IN_food_class_1309 = Set[ 1 ]
    TOKENS_FOLLOWING_INHERITS_IN_inherits_1320 = Set[ 21 ]
    TOKENS_FOLLOWING_ID_IN_inherits_1322 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_method_call_1335 = Set[ 13 ]
    TOKENS_FOLLOWING_DOT_IN_method_call_1339 = Set[ 21 ]
    TOKENS_FOLLOWING_method_call_params_IN_method_call_1341 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_method_call_params_1350 = Set[ 27 ]
    TOKENS_FOLLOWING_method_call_parameters_IN_method_call_params_1358 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_method_call_parameters_1365 = Set[ 5, 21, 27, 31, 32, 39, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_method_call_parameters_1371 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_COMMA_IN_method_call_parameters_1379 = Set[ 5, 21, 27, 31, 32, 48 ]
    TOKENS_FOLLOWING_mega_expression_IN_method_call_parameters_1383 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_RPAREN_IN_method_call_parameters_1397 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_comments_1406 = Set[ 48 ]
    TOKENS_FOLLOWING_WORD_IN_comments_1408 = Set[ 12 ]
    TOKENS_FOLLOWING_DIV_IN_comments_1410 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
