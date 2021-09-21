class VirtualMachine
#Title: initialize
#Input: quads
#Input Description: All the quadruples
#Output Description: Nothing
#Description: Initializes variables and calls start function
#Author: Victor Elizalde
  def initialize(quads) #method
    @current_context = {}
    @object_contexts = {}
    @functions_stack = []
    @context_stack = []
    @return_stack = []
    @new_context = {}
    @quad_number = 0
    @quads = quads
    start()
  end

#Title: is_memory
#Input: value
#Input Description: Valur
#Output Description: boolean
#Description: Checks if value is memory direction or value
#Author: Victor Elizalde
  def is_memory(value) #method
    if value[0] != '@'
      true
    else
      false
    end
  end

#Title: writing
#Input: value
#Input Description: value
#Output Description: print of value
#Description: Gets value and prints it
#Author: Victor Elizalde
  def writing(value) #method
    value = get_dir(value)
    puts get_value(value)
  end

#Title: is_number
#Input: value
#Input Description: Value
#Output Description: boolean
#Description: Checks if value is a number
#Author: Victor Elizalde
  def is_number(value) #method
    if is_bool(value)
      false
    elsif value[0] == "\""
      false
    else
      true
    end
  end

#Title: digest_type
#Input: type, var
#Input Description: type of variable and variable
#Output Description: Ruby class
#Description: matches our types with the ruby ones
#Author: Victor Elizalde
  def digest_type(type, var) #method
    if type == 'nocortable'
      'Fixnum'
    elsif type == 'estado'
      var.downcase!
      if var == 'verdadero'
        'TrueClass'
      elsif var == 'falso'
        'FalseClass'
      end
    else
      type
    end
  end

#Title: gotof
#Input: bool, jump
#Input Description: boolean value and quad jump
#Output Description: Nothing
#Description: Goes to the quad acoording to the bool value
#Author: Victor Elizalde
  def gotof(bool, jump) #method
    if !get_value(bool)
      @quad_number = jump - 1
    end
  end

#Title: get_dir
#Input: var
#Input Description: varible to get
#Output Description: direction of variable
#Description: Checks if the direction is value or not and converts it to direction
#Author: Victor Elizalde
  def get_dir(var) #method
    if var[0] == '('
      dir = digest_constant(var)
      @current_context[dir.to_i]
    else
      var
    end
  end

#Title: get_type
#Input: value
#Input Description: Value
#Output Description: converts value to ruby ones
#Description: Gets value of our type and converts it to ruby types
#Author: Victor Elizalde
  def get_type(value) #method
    if value == 'verdadero'
      true
    elsif value == 'falso'
      false
    elsif value.include? '.'
      value.to_f
    elsif value.scan(/\D/).empty?
      value.to_i
    else
      value
    end
  end

#Title: digest_constant
#Input: value
#Input Description: value
#Output Description: real value
#Description: modifie value for us to interpret
#Author: Victor Elizalde
  def digest_constant(value) #method
    if value[0] == '('
      value = value.gsub('(', '')
      value = value.gsub(')', '')
      value
    else
      value.gsub('@', '')
    end
  end

#Title: gosub
#Input: func_name, jump
#Input Description: function name and jump for execution
#Output Description: Nothing
#Description: Creates new context for function and adds function return to stack for recursive case and quad number set to the start of function
#Author: Victor Elizalde
  def gosub(func_name, jump) #method
    @current_context = @new_context
    @return_stack.push(@quad_number)
    @quad_number = jump - 1
  end

#Title: finish
#Input:
#Input Description: Nothing
#Output Description: Nothing
#Description: Ends the whole program
#Author: Victor Elizalde
  def finish() #method
    puts "Menu cooked successfully."
    exit
  end

#Title: start
#Input:
#Input Description: Nothing
#Output Description: Nothing
#Description: Starts execution, calls main function and interprets each quadruple and when done it calls the finish function to stop everything
#Author: Victor Elizalde
  def start() #method
    puts "Cooking menu..."
    while @quad_number < @quads.length
      interpret_quad(@quads[@quad_number])
      @quad_number += 1
    end
    finish()
  end

#Title: param
#Input: value, param
#Input Description: value of param and sets param number
#Output Description: Nothing
#Description: Sets to context function param the value
#Author: Victor Elizalde
  def param(value, param) #method
    @new_context[param] = get_value(value)
  end

#Title: endfunc
#Input:
#Input Description: Nothing
#Output Description: Nothing
#Description: kills function context and return to pending one and also kills return
#Author: Victor Elizalde
  def endfunc() #method
    @current_context = @context_stack.pop()
    @quad_number = @return_stack.pop()
  end

#Title: assignation
#Input: result, var
#Input Description: value to assign and variable to receive that value
#Output Description: Nothing
#Description: Gets direction of result and assigns it to the variable
#Author: Victor Elizalde
  def assignation(result, var) #method
    var = get_dir(var)
    result = get_dir(result)
    @current_context[var] = get_value(result)
  end

#Title: get_value
#Input: value
#Input Description: value to get
#Output Description: the real value
#Description: converts the value to the real value
#Author: Victor Elizalde
  def get_value(value) #method
    if is_memory(value)
      @current_context[value]
    else
      digested_value = digest_constant(value)
      if is_number(digested_value)
        get_type(digested_value)
      elsif is_bool(digested_value)
        get_type(digested_value)
      else
        digested_value
      end
    end
  end

#Title: is_bool
#Input: value
#Input Description: value
#Output Description: true or false
#Description: converts our bool to ruby bool
#Author: Victor Elizalde
  def is_bool(value) #method
    if value == 'verdadero' || value == 'falso'
      true
    else
      false
    end
  end

#Title: verify_limits
#Input: value, limit1, limit2
#Input Description: dim variable and limits
#Output Description: Nothing
#Description: verifies limit of dimensional object and raises error if not correct
#Author: Victor Elizalde
  def verify_limits(value, limit1, limit2) #method
    value = get_value(value)
    if !value.between?(limit1, limit2)
      puts "Fatal Error: #{value} exceeds limit."
      exit
    end
  end

#Title: era
#Input: object_name, func_name
#Input Description: object and function
#Output Description: Nothing
#Description: Initializes context either for function or method
#Author: Victor Elizalde
  def era(object_name, func_name) #method
    @functions_stack.push(func_name)
    @context_stack.push(@current_context)

    if object_name == nil
      @new_context = {}
    else
      if @object_contexts[object_name] == nil
        @object_contexts[object_name] = {}
        @new_context = @object_contexts[object_name]
      else
        @new_context = @object_contexts[object_name]
      end
    end
  end

#Title: return_func
#Input: value
#Input Description: value of return
#Output Description: Nothing
#Description: gets context and pops function
#Author: Victor Elizalde
  def return_func(value) #method
    past_context = @context_stack.pop()
    past_context[@functions_stack.pop()] = get_value(value)
    @context_stack.push(past_context)
  end

#Title: add
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: Multiplies
#Author: Victor Elizalde
  def add(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) + get_value(right)
  end

#Title: subtract
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: subtracts
#Author: Victor Elizalde
  def subtract(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) - get_value(right)
  end

#Title: multiply
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: Multiplies
#Author: Victor Elizalde
  def multiply(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) * get_value(right)
  end

#Title: less_than
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: checks less than
#Author: Victor Elizalde
  def less_than(left, right, result) #method
    @current_context[result] = get_value(left) < get_value(right)
  end

#Title: greater_than
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: checks greater than
#Author: Victor Elizalde
  def greater_than(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) > get_value(right)
  end

#Title: less_or_equal_than
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: checks less or equal than
#Author: Victor Elizalde
  def less_or_equal_than(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) <= get_value(right)
  end

#Title: greater_or_equal_than
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: checks greater or equal than
#Author: Victor Elizalde
  def greater_or_equal_than(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) >= get_value(right)
  end

#Title: equal
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: Assigns value
#Author: Victor Elizalde
  def equal(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) == get_value(right)
  end

#Title: different_from
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: checks if its different
#Author: Victor Elizalde
  def different_from(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) != get_value(right)
  end

#Title: and_op
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: makes and operator
#Author: Victor Elizalde
  def and_op(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) && get_value(right)
  end

#Title: or_op
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: makes or operator
#Author: Victor Elizalde
  def or_op(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left) || get_value(right)
  end

#Title: divide
#Input: left, right, result
#Input Description: left and right value and result is result
#Output Description: Nothing
#Description: divides values
#Author: Victor Elizalde
  def divide(left, right, result) #method
    left = get_dir(left)
    right = get_dir(right)
    @current_context[result] = get_value(left).to_f / get_value(right).to_f
  end

#Title: interpret_quad
#Input: quad
#Input Description: quadruple
#Output Description: Nothing
#Description: calls function for quadruple type
#Author: Victor Elizalde
  def interpret_quad(quad) #method
    process = quad.operator
    case process
    when '+'
      add(quad.first_col, quad.second_col, quad.result)
    when '-'
      subtract(quad.first_col, quad.second_col, quad.result)
    when '*'
      multiply(quad.first_col, quad.second_col, quad.result)
    when '/'
      divide(quad.first_col, quad.second_col, quad.result)
    when '<'
      less_than(quad.first_col, quad.second_col, quad.result)
    when '>'
      greater_than(quad.first_col, quad.second_col, quad.result)
    when '<='
      less_or_equal_than(quad.first_col, quad.second_col, quad.result)
    when '>='
      greater_or_equal_than(quad.first_col, quad.second_col, quad.result)
    when '=='
      equal(quad.first_col, quad.second_col, quad.result)
    when '<>'
      different_from(quad.first_col, quad.second_col, quad.result)
    when '&&'
      and_op(quad.first_col, quad.second_col, quad.result)
    when '||'
      or_op(quad.first_col, quad.second_col, quad.result)
    when '='
      assignation(quad.first_col, quad.result)
    when 'GOTO'
      @quad_number = quad.result - 1
    when 'GOTOF'
      gotof(quad.first_col, quad.result)
    when 'ERA'
      era(quad.first_col, quad.result)
    when 'PARAM'
      param(quad.first_col, quad.result)
    when 'GOSUB'
      gosub(quad.first_col, quad.result)
    when 'ENDFUNC'
      endfunc()
    when 'VER'
      verify_limits(quad.first_col, quad.second_col, quad.result)
    when 'read'
      reading(quad.second_col, quad.result)
    when 'print'
      writing(quad.first_col)
    when 'return'
      return_func(quad.first_col)
    end
  end

#Title: reading
#Input: var, var_type
#Input Description: variable to put value, variable type
#Output Description: Nothing
#Description: Assigns user input value to variable
#Author: Victor Elizalde
  def reading(var, var_type) #method
    user_input = $stdin.gets.chomp
    user_input_type = get_type(user_input)
    user_input_class = user_input_type.class
    type = digest_type(var_type, user_input)
    if user_input_class.to_s == type
      @current_context[var] = user_input_type
    else
      puts "Fatal Error: semantic cube error, expected #{var_type} and got #{user_input_class}."
      exit
    end
  end
end
