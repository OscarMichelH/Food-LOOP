#!/usr/bin/env ruby
#
# FoodLOOP.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: FoodLOOP.g
# Generated at: 2018-11-20 04:30:36
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

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = FoodLOOP
    include TokenData

    begin
      generated_using( "FoodLOOP.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "PROGRAM", "PRINT", "VAR", "CTE", "IF", "ELSE", "AND", 
                     "OR", "GT", "GTE", "LT", "LTE", "INTEGER", "FLOAT", 
                     "STRING", "BOOLEAN", "VOID", "FUNCTION", "FIN", "RETURN", 
                     "INPUT", "WHILE", "CLASS", "WORD", "NUM_I", "NUM_F", 
                     "BOOL", "ID", "LPAREN", "RPAREN", "LKEY", "RKEY", "EQUAL", 
                     "DIF", "SIMILAR", "COMMA", "DDOT", "SEMI", "PLUS", 
                     "SUB", "DIV", "MUL", "INHERITS", "DOT", "WHITESPACE" ].freeze
    RULE_METHODS = [ :program!, :print!, :var!, :cte!, :if!, :else!, :and!, 
                     :or!, :gt!, :gte!, :lt!, :lte!, :integer!, :float!, 
                     :string!, :boolean!, :void!, :function!, :fin!, :return!, 
                     :input!, :while!, :class!, :word!, :num_i!, :num_f!, 
                     :bool!, :id!, :lparen!, :rparen!, :lkey!, :rkey!, :equal!, 
                     :dif!, :similar!, :comma!, :ddot!, :semi!, :plus!, 
                     :sub!, :div!, :mul!, :inherits!, :dot!, :whitespace! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule program! (PROGRAM)
    # (in FoodLOOP.g)
    def program!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = PROGRAM
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 22:10: 'menu'
      match( "menu" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule print! (PRINT)
    # (in FoodLOOP.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 23:8: 'mostrar'
      match( "mostrar" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule var! (VAR)
    # (in FoodLOOP.g)
    def var!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = VAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 24:6: 'ingrediente'
      match( "ingrediente" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule cte! (CTE)
    # (in FoodLOOP.g)
    def cte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = CTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 25:6: 'utensilio'
      match( "utensilio" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule if! (IF)
    # (in FoodLOOP.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 26:5: 'si'
      match( "si" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule else! (ELSE)
    # (in FoodLOOP.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 27:7: 'sino'
      match( "sino" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule and! (AND)
    # (in FoodLOOP.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 28:6: '&&'
      match( "&&" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule or! (OR)
    # (in FoodLOOP.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 29:5: '||'
      match( "||" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule gt! (GT)
    # (in FoodLOOP.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 30:5: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule gte! (GTE)
    # (in FoodLOOP.g)
    def gte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = GTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 31:6: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule lt! (LT)
    # (in FoodLOOP.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 32:5: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule lte! (LTE)
    # (in FoodLOOP.g)
    def lte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = LTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 33:6: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule integer! (INTEGER)
    # (in FoodLOOP.g)
    def integer!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = INTEGER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 34:10: 'nocortable'
      match( "nocortable" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule float! (FLOAT)
    # (in FoodLOOP.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 35:8: 'cortable'
      match( "cortable" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule string! (STRING)
    # (in FoodLOOP.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 36:9: 'nombre'
      match( "nombre" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule boolean! (BOOLEAN)
    # (in FoodLOOP.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 37:10: 'estado'
      match( "estado" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule void! (VOID)
    # (in FoodLOOP.g)
    def void!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )



      type = VOID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 38:7: 'proceso'
      match( "proceso" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule function! (FUNCTION)
    # (in FoodLOOP.g)
    def function!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = FUNCTION
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 39:11: 'receta'
      match( "receta" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule fin! (FIN)
    # (in FoodLOOP.g)
    def fin!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )



      type = FIN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 40:6: 'terminar'
      match( "terminar" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )


    end

    # lexer rule return! (RETURN)
    # (in FoodLOOP.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )



      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 41:9: 'servir'
      match( "servir" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )


    end

    # lexer rule input! (INPUT)
    # (in FoodLOOP.g)
    def input!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )



      type = INPUT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 42:8: 'traer'
      match( "traer" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule while! (WHILE)
    # (in FoodLOOP.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )



      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 43:8: 'mientras'
      match( "mientras" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule class! (CLASS)
    # (in FoodLOOP.g)
    def class!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )



      type = CLASS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 44:8: 'platillo'
      match( "platillo" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )


    end

    # lexer rule word! (WORD)
    # (in FoodLOOP.g)
    def word!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )



      type = WORD
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 45:5: ( '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\'' | '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"' )
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x27 )
        alt_3 = 1
      elsif ( look_3_0 == 0x22 )
        alt_3 = 2
      else
        raise NoViableAlternative( "", 3, 0 )

      end
      case alt_3
      when 1
        # at line 45:7: '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\''
        match( 0x27 )
        # at line 45:12: (~ ( '\\'' | '\\\\' ) | '\\\\' . )*
        while true # decision 1
          alt_1 = 3
          look_1_0 = @input.peek( 1 )

          if ( look_1_0.between?( 0x0, 0x26 ) || look_1_0.between?( 0x28, 0x5b ) || look_1_0.between?( 0x5d, 0xffff ) )
            alt_1 = 1
          elsif ( look_1_0 == 0x5c )
            alt_1 = 2

          end
          case alt_1
          when 1
            # at line 45:14: ~ ( '\\'' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 45:33: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 1
          end
        end # loop for decision 1

        match( 0x27 )

      when 2
        # at line 45:50: '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"'
        match( 0x22 )
        # at line 45:55: (~ ( '\"' | '\\\\' ) | '\\\\' . )*
        while true # decision 2
          alt_2 = 3
          look_2_0 = @input.peek( 1 )

          if ( look_2_0.between?( 0x0, 0x21 ) || look_2_0.between?( 0x23, 0x5b ) || look_2_0.between?( 0x5d, 0xffff ) )
            alt_2 = 1
          elsif ( look_2_0 == 0x5c )
            alt_2 = 2

          end
          case alt_2
          when 1
            # at line 45:57: ~ ( '\"' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 45:76: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2

        match( 0x22 )

      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )


    end

    # lexer rule num_i! (NUM_I)
    # (in FoodLOOP.g)
    def num_i!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )



      type = NUM_I
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 46:8: ( '0' .. '9' )+
      # at file 46:8: ( '0' .. '9' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_4 > 0 and break
          eee = EarlyExit(4)


          raise eee
        end
        match_count_4 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )


    end

    # lexer rule num_f! (NUM_F)
    # (in FoodLOOP.g)
    def num_f!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )



      type = NUM_F
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 47:8: ( '0' .. '9' )+ '.' ( '0' .. '9' )+
      # at file 47:8: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_5 > 0 and break
          eee = EarlyExit(5)


          raise eee
        end
        match_count_5 += 1
      end


      match( 0x2e )
      # at file 47:24: ( '0' .. '9' )+
      match_count_6 = 0
      while true
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0.between?( 0x30, 0x39 ) )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_6 > 0 and break
          eee = EarlyExit(6)


          raise eee
        end
        match_count_6 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )


    end

    # lexer rule bool! (BOOL)
    # (in FoodLOOP.g)
    def bool!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )



      type = BOOL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 48:7: ( 'verdadero' | 'falso' )
      # at line 48:7: ( 'verdadero' | 'falso' )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == 0x76 )
        alt_7 = 1
      elsif ( look_7_0 == 0x66 )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        # at line 48:9: 'verdadero'
        match( "verdadero" )


      when 2
        # at line 48:23: 'falso'
        match( "falso" )


      end


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end

    # lexer rule id! (ID)
    # (in FoodLOOP.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )



      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 49:5: ( 'a' .. 'z' | 'A' .. 'Z' ) ( ( 'a' .. 'z' | 'A' .. 'Z' ) | '_' | ( '0' .. '9' ) )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 49:33: ( ( 'a' .. 'z' | 'A' .. 'Z' ) | '_' | ( '0' .. '9' ) )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0.between?( 0x30, 0x39 ) || look_8_0.between?( 0x41, 0x5a ) || look_8_0 == 0x5f || look_8_0.between?( 0x61, 0x7a ) )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          break # out of loop for decision 8
        end
      end # loop for decision 8



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end

    # lexer rule lparen! (LPAREN)
    # (in FoodLOOP.g)
    def lparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )



      type = LPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 50:9: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )


    end

    # lexer rule rparen! (RPAREN)
    # (in FoodLOOP.g)
    def rparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )



      type = RPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 51:9: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )


    end

    # lexer rule lkey! (LKEY)
    # (in FoodLOOP.g)
    def lkey!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )



      type = LKEY
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 52:7: '['
      match( 0x5b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )


    end

    # lexer rule rkey! (RKEY)
    # (in FoodLOOP.g)
    def rkey!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )



      type = RKEY
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 53:7: ']'
      match( 0x5d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end

    # lexer rule equal! (EQUAL)
    # (in FoodLOOP.g)
    def equal!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )



      type = EQUAL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 54:8: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end

    # lexer rule dif! (DIF)
    # (in FoodLOOP.g)
    def dif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )



      type = DIF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 55:6: '<>'
      match( "<>" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule similar! (SIMILAR)
    # (in FoodLOOP.g)
    def similar!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = SIMILAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 56:10: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule comma! (COMMA)
    # (in FoodLOOP.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )



      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 57:8: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )


    end

    # lexer rule ddot! (DDOT)
    # (in FoodLOOP.g)
    def ddot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = DDOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 58:7: ':'
      match( 0x3a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule semi! (SEMI)
    # (in FoodLOOP.g)
    def semi!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = SEMI
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 59:7: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # lexer rule plus! (PLUS)
    # (in FoodLOOP.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 60:7: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )


    end

    # lexer rule sub! (SUB)
    # (in FoodLOOP.g)
    def sub!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )



      type = SUB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 61:6: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )


    end

    # lexer rule div! (DIV)
    # (in FoodLOOP.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 62:6: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )


    end

    # lexer rule mul! (MUL)
    # (in FoodLOOP.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )



      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 63:6: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )


    end

    # lexer rule inherits! (INHERITS)
    # (in FoodLOOP.g)
    def inherits!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )



      type = INHERITS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 64:11: '<<'
      match( "<<" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )


    end

    # lexer rule dot! (DOT)
    # (in FoodLOOP.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 65:6: '.'
      match( 0x2e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule whitespace! (WHITESPACE)
    # (in FoodLOOP.g)
    def whitespace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = WHITESPACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 66:14: ( '\\t' | '\\f' | '\\n' | '\\r' | ' ' | '\\u00A0' )+
      # at file 66:14: ( '\\t' | '\\f' | '\\n' | '\\r' | ' ' | '\\u00A0' )+
      match_count_9 = 0
      while true
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( 0x9, 0xa ) || look_9_0.between?( 0xc, 0xd ) || look_9_0 == 0x20 || look_9_0 == 0xa0 )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek( 1 ).between?( 0xc, 0xd ) || @input.peek(1) == 0x20 || @input.peek(1) == 0xa0
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_9 > 0 and break
          eee = EarlyExit(9)


          raise eee
        end
        match_count_9 += 1
      end



      # --> action
       channel=HIDDEN; 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( PROGRAM | PRINT | VAR | CTE | IF | ELSE | AND | OR | GT | GTE | LT | LTE | INTEGER | FLOAT | STRING | BOOLEAN | VOID | FUNCTION | FIN | RETURN | INPUT | WHILE | CLASS | WORD | NUM_I | NUM_F | BOOL | ID | LPAREN | RPAREN | LKEY | RKEY | EQUAL | DIF | SIMILAR | COMMA | DDOT | SEMI | PLUS | SUB | DIV | MUL | INHERITS | DOT | WHITESPACE )
      alt_10 = 45
      alt_10 = @dfa10.predict( @input )
      case alt_10
      when 1
        # at line 1:10: PROGRAM
        program!


      when 2
        # at line 1:18: PRINT
        print!


      when 3
        # at line 1:24: VAR
        var!


      when 4
        # at line 1:28: CTE
        cte!


      when 5
        # at line 1:32: IF
        if!


      when 6
        # at line 1:35: ELSE
        else!


      when 7
        # at line 1:40: AND
        and!


      when 8
        # at line 1:44: OR
        or!


      when 9
        # at line 1:47: GT
        gt!


      when 10
        # at line 1:50: GTE
        gte!


      when 11
        # at line 1:54: LT
        lt!


      when 12
        # at line 1:57: LTE
        lte!


      when 13
        # at line 1:61: INTEGER
        integer!


      when 14
        # at line 1:69: FLOAT
        float!


      when 15
        # at line 1:75: STRING
        string!


      when 16
        # at line 1:82: BOOLEAN
        boolean!


      when 17
        # at line 1:90: VOID
        void!


      when 18
        # at line 1:95: FUNCTION
        function!


      when 19
        # at line 1:104: FIN
        fin!


      when 20
        # at line 1:108: RETURN
        return!


      when 21
        # at line 1:115: INPUT
        input!


      when 22
        # at line 1:121: WHILE
        while!


      when 23
        # at line 1:127: CLASS
        class!


      when 24
        # at line 1:133: WORD
        word!


      when 25
        # at line 1:138: NUM_I
        num_i!


      when 26
        # at line 1:144: NUM_F
        num_f!


      when 27
        # at line 1:150: BOOL
        bool!


      when 28
        # at line 1:155: ID
        id!


      when 29
        # at line 1:158: LPAREN
        lparen!


      when 30
        # at line 1:165: RPAREN
        rparen!


      when 31
        # at line 1:172: LKEY
        lkey!


      when 32
        # at line 1:177: RKEY
        rkey!


      when 33
        # at line 1:182: EQUAL
        equal!


      when 34
        # at line 1:188: DIF
        dif!


      when 35
        # at line 1:192: SIMILAR
        similar!


      when 36
        # at line 1:200: COMMA
        comma!


      when 37
        # at line 1:206: DDOT
        ddot!


      when 38
        # at line 1:211: SEMI
        semi!


      when 39
        # at line 1:216: PLUS
        plus!


      when 40
        # at line 1:221: SUB
        sub!


      when 41
        # at line 1:225: DIV
        div!


      when 42
        # at line 1:229: MUL
        mul!


      when 43
        # at line 1:233: INHERITS
        inherits!


      when 44
        # at line 1:242: DOT
        dot!


      when 45
        # at line 1:246: WHITESPACE
        whitespace!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 1, -1, 4, 19, 2, -1, 1, 42, 1, 46, 6, 19, 1, -1, 1, 
                    55, 2, 19, 5, -1, 1, 60, 9, -1, 5, 19, 1, 67, 1, 19, 
                    6, -1, 8, 19, 2, -1, 2, 19, 2, -1, 6, 19, 1, -1, 12, 
                    19, 1, 98, 4, 19, 1, 103, 12, 19, 1, -1, 4, 19, 1, -1, 
                    9, 19, 1, 129, 1, 19, 1, 131, 4, 19, 1, 136, 1, 19, 
                    1, 138, 1, 19, 1, 140, 2, 19, 1, 143, 1, 19, 1, -1, 
                    1, 19, 1, -1, 1, 146, 3, 19, 1, -1, 1, 19, 1, -1, 1, 
                    19, 1, -1, 1, 152, 1, 19, 1, -1, 2, 19, 1, -1, 1, 156, 
                    3, 19, 1, 160, 1, -1, 1, 161, 1, 162, 1, 19, 1, -1, 
                    1, 19, 1, 165, 1, 19, 3, -1, 1, 131, 1, 19, 1, -1, 1, 
                    168, 1, 169, 2, -1 )
      EOF = unpack( 170, -1 )
      MIN = unpack( 1, 9, 1, 101, 1, 110, 1, 116, 1, 101, 2, -1, 1, 61, 
                    1, 60, 2, 111, 1, 115, 1, 108, 2, 101, 1, -1, 1, 46, 
                    1, 101, 1, 97, 5, -1, 1, 61, 9, -1, 1, 110, 1, 115, 
                    1, 101, 1, 103, 1, 101, 1, 48, 1, 114, 6, -1, 1, 99, 
                    1, 114, 1, 116, 1, 111, 1, 97, 1, 99, 1, 114, 1, 97, 
                    2, -1, 1, 114, 1, 108, 2, -1, 1, 117, 1, 116, 1, 110, 
                    1, 114, 1, 110, 1, 111, 1, -1, 1, 118, 1, 111, 1, 98, 
                    1, 116, 1, 97, 1, 99, 1, 116, 1, 101, 1, 109, 1, 101, 
                    1, 100, 1, 115, 1, 48, 1, 114, 1, 116, 1, 101, 1, 115, 
                    1, 48, 1, 105, 2, 114, 1, 97, 1, 100, 1, 101, 1, 105, 
                    1, 116, 1, 105, 1, 114, 1, 97, 1, 111, 1, -1, 1, 97, 
                    1, 114, 1, 100, 1, 105, 1, -1, 1, 114, 1, 116, 1, 101, 
                    1, 98, 1, 111, 1, 115, 1, 108, 1, 97, 1, 110, 1, 48, 
                    1, 100, 1, 48, 1, 114, 1, 97, 1, 105, 1, 108, 1, 48, 
                    1, 97, 1, 48, 1, 108, 1, 48, 1, 111, 1, 108, 1, 48, 
                    1, 97, 1, -1, 1, 101, 1, -1, 1, 48, 1, 115, 1, 101, 
                    1, 105, 1, -1, 1, 98, 1, -1, 1, 101, 1, -1, 1, 48, 1, 
                    111, 1, -1, 2, 114, 1, -1, 1, 48, 1, 110, 1, 111, 1, 
                    108, 1, 48, 1, -1, 2, 48, 1, 111, 1, -1, 1, 116, 1, 
                    48, 1, 101, 3, -1, 1, 48, 1, 101, 1, -1, 2, 48, 2, -1 )
      MAX = unpack( 1, 160, 1, 111, 1, 110, 1, 116, 1, 105, 2, -1, 1, 61, 
                    1, 62, 2, 111, 1, 115, 1, 114, 1, 101, 1, 114, 1, -1, 
                    1, 57, 1, 101, 1, 97, 5, -1, 1, 61, 9, -1, 1, 110, 1, 
                    115, 1, 101, 1, 103, 1, 101, 1, 122, 1, 114, 6, -1, 
                    1, 109, 1, 114, 1, 116, 1, 111, 1, 97, 1, 99, 1, 114, 
                    1, 97, 2, -1, 1, 114, 1, 108, 2, -1, 1, 117, 1, 116, 
                    1, 110, 1, 114, 1, 110, 1, 111, 1, -1, 1, 118, 1, 111, 
                    1, 98, 1, 116, 1, 97, 1, 99, 1, 116, 1, 101, 1, 109, 
                    1, 101, 1, 100, 1, 115, 1, 122, 1, 114, 1, 116, 1, 101, 
                    1, 115, 1, 122, 1, 105, 2, 114, 1, 97, 1, 100, 1, 101, 
                    1, 105, 1, 116, 1, 105, 1, 114, 1, 97, 1, 111, 1, -1, 
                    1, 97, 1, 114, 1, 100, 1, 105, 1, -1, 1, 114, 1, 116, 
                    1, 101, 1, 98, 1, 111, 1, 115, 1, 108, 1, 97, 1, 110, 
                    1, 122, 1, 100, 1, 122, 1, 114, 1, 97, 1, 105, 1, 108, 
                    1, 122, 1, 97, 1, 122, 1, 108, 1, 122, 1, 111, 1, 108, 
                    1, 122, 1, 97, 1, -1, 1, 101, 1, -1, 1, 122, 1, 115, 
                    1, 101, 1, 105, 1, -1, 1, 98, 1, -1, 1, 101, 1, -1, 
                    1, 122, 1, 111, 1, -1, 2, 114, 1, -1, 1, 122, 1, 110, 
                    1, 111, 1, 108, 1, 122, 1, -1, 2, 122, 1, 111, 1, -1, 
                    1, 116, 1, 122, 1, 101, 3, -1, 1, 122, 1, 101, 1, -1, 
                    2, 122, 2, -1 )
      ACCEPT = unpack( 5, -1, 1, 7, 1, 8, 8, -1, 1, 24, 3, -1, 1, 28, 1, 
                       29, 1, 30, 1, 31, 1, 32, 1, -1, 1, 36, 1, 37, 1, 
                       38, 1, 39, 1, 40, 1, 41, 1, 42, 1, 44, 1, 45, 7, 
                       -1, 1, 10, 1, 9, 1, 12, 1, 34, 1, 43, 1, 11, 8, -1, 
                       1, 25, 1, 26, 2, -1, 1, 35, 1, 33, 6, -1, 1, 5, 30, 
                       -1, 1, 1, 4, -1, 1, 6, 25, -1, 1, 21, 1, -1, 1, 27, 
                       4, -1, 1, 20, 1, -1, 1, 15, 1, -1, 1, 16, 2, -1, 
                       1, 18, 2, -1, 1, 2, 5, -1, 1, 17, 3, -1, 1, 22, 3, 
                       -1, 1, 14, 1, 23, 1, 19, 2, -1, 1, 4, 2, -1, 1, 13, 
                       1, 3 )
      SPECIAL = unpack( 170, -1 )
      TRANSITION = [
        unpack( 2, 33, 1, -1, 2, 33, 18, -1, 1, 33, 1, -1, 1, 15, 3, -1, 
                1, 5, 1, 15, 1, 20, 1, 21, 1, 31, 1, 28, 1, 25, 1, 29, 1, 
                32, 1, 30, 10, 16, 1, 26, 1, 27, 1, 8, 1, 24, 1, 7, 2, -1, 
                26, 19, 1, 22, 1, -1, 1, 23, 3, -1, 2, 19, 1, 10, 1, 19, 
                1, 11, 1, 18, 2, 19, 1, 2, 3, 19, 1, 1, 1, 9, 1, 19, 1, 
                12, 1, 19, 1, 13, 1, 4, 1, 14, 1, 3, 1, 17, 4, 19, 1, -1, 
                1, 6, 35, -1, 1, 33 ),
        unpack( 1, 34, 3, -1, 1, 36, 5, -1, 1, 35 ),
        unpack( 1, 37 ),
        unpack( 1, 38 ),
        unpack( 1, 40, 3, -1, 1, 39 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 41 ),
        unpack( 1, 45, 1, 43, 1, 44 ),
        unpack( 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 51, 5, -1, 1, 50 ),
        unpack( 1, 52 ),
        unpack( 1, 53, 12, -1, 1, 54 ),
        unpack(  ),
        unpack( 1, 56, 1, -1, 10, 16 ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 59 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 61 ),
        unpack( 1, 62 ),
        unpack( 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 13, 19, 1, 
                 66, 12, 19 ),
        unpack( 1, 68 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 69, 9, -1, 1, 70 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack(  ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack( 1, 106 ),
        unpack( 1, 107 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack(  ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack(  ),
        unpack( 1, 120 ),
        unpack( 1, 121 ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack( 1, 124 ),
        unpack( 1, 125 ),
        unpack( 1, 126 ),
        unpack( 1, 127 ),
        unpack( 1, 128 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 130 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 132 ),
        unpack( 1, 133 ),
        unpack( 1, 134 ),
        unpack( 1, 135 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 137 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 139 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 141 ),
        unpack( 1, 142 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 144 ),
        unpack(  ),
        unpack( 1, 145 ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 147 ),
        unpack( 1, 148 ),
        unpack( 1, 149 ),
        unpack(  ),
        unpack( 1, 150 ),
        unpack(  ),
        unpack( 1, 151 ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 153 ),
        unpack(  ),
        unpack( 1, 154 ),
        unpack( 1, 155 ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 157 ),
        unpack( 1, 158 ),
        unpack( 1, 159 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 163 ),
        unpack(  ),
        unpack( 1, 164 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 166 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 1, 167 ),
        unpack(  ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack( 10, 19, 7, -1, 26, 19, 4, -1, 1, 19, 1, -1, 26, 19 ),
        unpack(  ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 10


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( PROGRAM | PRINT | VAR | CTE | IF | ELSE | AND | OR | GT | GTE | LT | LTE | INTEGER | FLOAT | STRING | BOOLEAN | VOID | FUNCTION | FIN | RETURN | INPUT | WHILE | CLASS | WORD | NUM_I | NUM_F | BOOL | ID | LPAREN | RPAREN | LKEY | RKEY | EQUAL | DIF | SIMILAR | COMMA | DDOT | SEMI | PLUS | SUB | DIV | MUL | INHERITS | DOT | WHITESPACE );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end
