require_relative "SemanticCube"
require_relative "Quadruple"
require_relative "Manager"

class QuadrupleGenerator
  attr_accessor :param_index
  #Title: initialize
  #Input: manager
  #Input Description: manager of program
  #Output Description: Nothing
  #Description: Initializes variables
  #Author: Victor Elizalde
  def initialize(manager)
    @missing_brackets_on_dim = false
    @sem_cube = SemanticCube.new()
    @ids_and_values_stack = []
    @operators_stack = []
    @manager = manager
    @memory_stack = []
    @types_stack = []
    @jumps_stack = []
    @param_index = 0
    @dim_stack = []
  end

  #Title: remove_false_bottom
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: removes the false bottom parenthesis
  #Author: Victor Elizalde
  def remove_false_bottom()
    @operators_stack.pop()
  end

  #Title: update_dim
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: sums 1 to dimension
  #Author: Victor Elizalde
  def update_dim()
    @dim_stack.last()[1] += 1
  end

  #Title: add_operator
  #Input: operator
  #Input Description: operator in turn
  #Output Description: Nothing
  #Description: pushes new operator to stack
  #Author: Victor Elizalde
  def add_operator(operator)
    @operators_stack.push(operator)
  end

  #Title: add_false_bottom
  #Input: parenthesis
  #Input Description: the parenthesis to put in the stack
  #Output Description: Nothing
  #Description: puts parenthesis in stack
  #Author: Victor Elizalde
  def add_false_bottom(parentesis)
    @operators_stack.push(parentesis)
  end

  #Title: add_jump
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: adds jump to stack
  #Author: Victor Elizalde
  def add_jump()
    @jumps_stack.push(@manager.counter)
  end

  #Title: assign_read
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates read quad
  #Author: Victor Elizalde
  def assign_read()
    @ids_and_values_stack.pop()
    id = @memory_stack.pop()
    @types_stack.pop()
    operator = @operators_stack.pop()
    quad = Quadruple.new(operator, id, nil, id)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: goto
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates goto quad
  #Author: Victor Elizalde
  def goto()
    quad = Quadruple.new("GOTO", nil, nil, nil)
    @manager.add_quad(quad)
    fill_pending_quad()
    @jumps_stack.push(@manager.counter)
    @manager.counter += 1
  end

  #Title: goto_main
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates goto main quad
  #Author: Victor Elizalde
  def goto_main()
    quad = Quadruple.new("GOTO", nil, nil, nil)
    @manager.add_quad(quad)
    @jumps_stack.push(@manager.counter)
    @manager.counter += 1
  end

  #Title: add_id
  #Input: id, value
  #Input Description: id and value
  #Output Description: Nothing
  #Description: read current id
  #Author: Victor Elizalde
  def add_id(id, value)
    if id != nil
      var = get_variable(id)

      if var.has_dim
        @missing_brackets_on_dim = true
      end

      if find_variable(id)
        var = get_variable(id)
        @ids_and_values_stack.push(var.name)
        @types_stack.push(var.type)
        @memory_stack.push(var.memory_dir)
      else
        puts "Fatal Error: #{id} doesn't exists."
        exit
      end

    elsif value != nil
      var_type = match_value(value)
      var_value = extract_value(value)
      @ids_and_values_stack.push("@#{var_value}")
      @memory_stack.push("@#{var_value}")
      @types_stack.push(var_type)
    end
  end

  #Title: end_function
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates end function quad
  #Author: Victor Elizalde
  def end_function()
    quad = Quadruple.new("ENDFUNC", nil, nil, nil)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: check_dim
  #Input: id
  #Input Description: id of dimension
  #Output Description: Nothing
  #Description: checks if brackets were written
  #Author: Victor Elizalde
  def check_dim(id)
    if @missing_brackets_on_dim
      puts "Fatal Error: Missing limits for #{id}."
      exit
    end
  end

  #Title: has_dim
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: checks if variable has dimension
  #Author: Victor Elizalde
  def has_dim()
    @missing_brackets_on_dim = false
    id = @ids_and_values_stack.pop()
    @memory_stack.pop()
    @types_stack.pop()

    if !get_variable(id).has_dim
      puts "Error #{id} is not a dimensional variable."
      exit
    end

    dim = 0
    @dim_stack.push([id, dim])
    add_false_bottom("(")
  end

  #Title: write
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates write quad
  #Author: Victor Elizalde
  def write()
    @ids_and_values_stack.pop()
    memory_dir = @memory_stack.pop()
    type = @types_stack.pop()
    quad = Quadruple.new("print", memory_dir, nil, nil)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: goto_while
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates goto while quad
  #Author: Victor Elizalde
  def goto_while()
    fill_pending_quad()
    quad_number = @jumps_stack.pop()
    quad = Quadruple.new("GOTO", nil, nil, quad_number)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: generate_dim_quads
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: process for dimension variable
  #Author: Victor Elizalde
  def generate_dim_quads()
    verify_dim_access()
    @ids_and_values_stack.pop()
    acum = @memory_stack.pop()
    @types_stack.pop()
    dim_id = @dim_stack.last()[0]
    dim_dir = get_variable(dim_id).memory_dir
    @manager.set_memory_next()
    temp = @manager.memory_counter
    quad = Quadruple.new('+', acum, "@#{dim_dir}", temp)
    @manager.add_quad(quad)
    @manager.counter += 1
    @ids_and_values_stack.push("(#{temp})")
    @memory_stack.push("(#{temp})")
    id_type = get_variable(dim_id).type
    @types_stack.push(id_type)
    remove_false_bottom()
    @dim_stack.pop()
  end

  #Title: get_return_value
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: assigns return value of function
  #Author: Victor Elizalde
  def get_return_value()
    func_name = @ids_and_values_stack.pop()
    @memory_stack.pop()
    func_type = @types_stack.pop()
    @manager.set_memory_next()
    memory_dir = @manager.memory_counter()
    quad = Quadruple.new("=", func_name, nil, memory_dir)
    @ids_and_values_stack.push(memory_dir)
    @memory_stack.push(memory_dir)
    @types_stack.push(func_type)
    @manager.quadruples.push(quad)
    @manager.counter += 1
  end

  #Title: fill_main_quad
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: fills jump in main quad
  #Author: Victor Elizalde
  def fill_main_quad()
    quad_number = @jumps_stack.pop()
    @manager.quadruples[quad_number].result = @manager.counter
  end

  #Title: find_variable
  #Input: id
  #Input Description: variable id
  #Output Description: Nothing
  #Description: Checks if variable exists in contexts
  #Author: Victor Elizalde
  def find_variable(id)
    current_context = @manager.current_context
    past_context = @manager.past_context

    if current_context.variable_directories.variable_exists?(id)
      true
    elsif past_context.variable_directories.variable_exists?(id)
      true
    else
      false
    end
  end

  #Title: get_variable
  #Input: id
  #Input Description: id
  #Output Description: variable with id
  #Description: gets a variable
  #Author: Victor Elizalde
  def get_variable(id)
    current_context = @manager.current_context
    past_context = @manager.past_context

    if current_context.variable_directories.variable_exists?(id)
      current_context.variable_directories.get_variable(id)
    elsif past_context.variable_directories.variable_exists?(id)
      past_context.variable_directories.get_variable(id)
    else
      puts "Fatal Error: #{id} doesn't exists."
      exit
    end
  end

  #Title: fill_pending_quad
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: fills pending quad jump
  #Author: Victor Elizalde
  def fill_pending_quad()
    quad_number = @jumps_stack.pop()
    @manager.quadruples[quad_number].result = @manager.counter + 1
  end

  #Title: generate_limit_quad
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: Makes the formula for one or two dimensions with s1m1 .. snmn
  #Author: Victor Elizalde
  def generate_limit_quad()
    id = @ids_and_values_stack.last()
    memory_id = @memory_stack.last()
    dim_id = @dim_stack.last()[0]
    dim = @dim_stack.last()[1]
    var_dim_obj = get_variable(dim_id).dim_objs

    if var_dim_obj[dim] == nil
      puts "Fatal Error: Wrong dimension size for #{dim_id}."
      exit
    end

    limit = var_dim_obj[dim].limit
    m = var_dim_obj[dim].m
    quad = Quadruple.new("VER", memory_id, 0, limit)
    @manager.add_quad(quad)
    @manager.counter += 1

    if var_dim_obj[dim + 1] != nil
      @ids_and_values_stack.pop()
      memory_dir = @memory_stack.pop()
      @types_stack.pop()
      @manager.set_memory_next()
      memory_value = @manager.memory_counter
      quad = Quadruple.new("*", memory_dir, "@#{m}", memory_value)
      @manager.add_quad(quad)
      @manager.counter += 1
      @ids_and_values_stack.push(memory_value)
      @memory_stack.push(memory_value)
      @types_stack.push("nocortable")
    elsif dim > 0
      @ids_and_values_stack.pop()
      acum2 = @memory_stack.pop()
      @types_stack.pop()
      @ids_and_values_stack.pop()
      acum1 = @memory_stack.pop()
      @types_stack.pop()
      @manager.set_memory_next()
      memory_value = @manager.memory_counter
      quad = Quadruple.new("+", acum1, acum2, memory_value)
      @manager.add_quad(quad)
      @manager.counter += 1
      @ids_and_values_stack.push(memory_value)
      @memory_stack.push(memory_value)
      @types_stack.push("nocortable")
    end
  end

  #Title: read
  #Input: id
  #Input Description: id
  #Output Description: Nothing
  #Description: creates read quad
  #Author: Victor Elizalde
  def read(id)
    var_type = get_variable(id).type
    quad = Quadruple.new("read", nil, @memory_stack.last(), var_type)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: is_exp_pending
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: checks if exp is pending
  #Author: Victor Elizalde
  def is_exp_pending()
    if @operators_stack.last() == "+" || @operators_stack.last() == "-"
      produce_quad()
    end
  end

  #Title: is_term_pending
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: checks if term is pending
  #Author: Victor Elizalde
  def is_term_pending()
    if @operators_stack.last() == "*" || @operators_stack.last() == "/"
      produce_quad()
    end
  end

  #Title: is_mega_expression_pending
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: checks if mega expression is pending
  #Author: Victor Elizalde
  def is_mega_expression_pending()
    if @operators_stack.last() == "&&" || @operators_stack.last() == "||"
      produce_quad()
    end
  end

  #Title: assign_quad
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates assignation quad
  #Author: Victor Elizalde
  def assign_quad()
    @ids_and_values_stack.pop()
    result = @memory_stack.pop()
    result_type = @types_stack.pop()
    @ids_and_values_stack.pop()
    id = @memory_stack.pop()
    id_type = @types_stack.pop()
    operator = @operators_stack.pop()

    if result_type == id_type
      quad = Quadruple.new(operator, result, nil, id)
      @manager.add_quad(quad)
      @manager.counter += 1
    else
      puts "Fatal Error: Different types #{id_type} and #{result_type}."
      exit
    end
  end

  #Title: gotof
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: creates gotof quad
  #Author: Victor Elizalde
  def gotof()
    type = @types_stack.pop()
    if type == "estado"
      @ids_and_values_stack.pop()
      result = @memory_stack.pop()
      quad = Quadruple.new("GOTOF", result, nil, nil)
      @manager.add_quad(quad)
      @jumps_stack.push(@manager.counter)
      @manager.counter += 1
    else
      puts "Fatal Error: semantic cube error, expecting estado got #{type}."
      exit
    end
  end

  #Title: go_sub_method
  #Input: id and method name
  #Input Description: id and name of method
  #Output Description: Nothing
  #Description: creates go sub quad for method
  #Author: Victor Elizalde
  def go_sub_method(id, method_name)
    context = method_exists?(id, method_name)
    quad_number = context.function_directories.functions[method_name].quad_number
    quad = Quadruple.new("GOSUB", method_name, nil, quad_number)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: era_method
  #Input: id, method name
  #Input Description: id and name of method
  #Output Description: Nothing
  #Description: creates era quad for method
  #Author: Victor Elizalde
  def era_method(id, method_name)
    context = method_exists?(id, method_name)
    return_type = context.function_directories.functions[method_name].return_type
    @ids_and_values_stack.push(method_name)
    @memory_stack.push(method_name)
    @types_stack.push(return_type)
    quad = Quadruple.new("ERA", id, nil, method_name)
    @manager.add_quad(quad)
    @manager.counter += 1
    @param_index = 0
  end

  #Title: verify_dim_access
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: verifies access is in bounds
  #Author: Victor Elizalde
  def verify_dim_access()
    curret_dim = @dim_stack.last()
    id = curret_dim[0]
    dim = curret_dim[1]
    object_dim_count = get_variable(id).dim_objs.count

    if dim + 1 != object_dim_count
      puts "Fatal Error: Received #{dim + 1} expected #{object_dim_count} limits."
      exit
    end
  end

  #Title: verify_func_param_count
  #Input: function name
  #Input Description: function name
  #Output Description: Nothing
  #Description: checks param count on functions
  #Author: Victor Elizalde
  def verify_func_param_count(func_name)
    function_params_count = @manager.past_context.function_directories.functions[func_name].parameters.count

    if function_params_count != @param_index
      puts "Fatal Error: Wrong number of parameters (received #{@param_index} instead of #{function_params_count}) in function call of #{func_name}."
      exit
    end
  end

  #Title: return
  #Input: function name
  #Input Description: function name
  #Output Description: Nothing
  #Description: creates return quad
  #Author: Victor Elizalde
  def return(func_name)
    func_type = @manager.past_context.function_directories.functions[func_name].return_type
    @ids_and_values_stack.pop()
    memory_dir = @memory_stack.pop()
    memory_dir_type = @types_stack.pop()

    if func_type != memory_dir_type
      puts "Fatal Error: Expected #{func_type} in return, got #{memory_dir_type}."
      exit
    else
      quad = Quadruple.new("return", memory_dir, nil, nil)
      @manager.add_quad(quad)
      @manager.counter += 1
    end
  end

  #Title: verify_method_param_count
  #Input: var_name, func_name
  #Input Description: variable and function name
  #Output Description: Nothing
  #Description: checks param count on methods
  #Author: Victor Elizalde
  def verify_method_param_count(var_name, func_name)
    context = method_exists?(var_name, func_name)
    method_params_count = context.function_directories.functions[func_name].parameters.count
    if method_params_count != @param_index
      puts "Fatal Error: Wrong number of parameters in #{func_name} call, expected #{method_params_count} got #{@param_index}."
      exit
    end
  end

  #Title: function_exists
  #Input: id
  #Input Description: function id
  #Output Description: Nothing
  #Description: checks that function exists
  #Author: Victor Elizalde
  def function_exists?(id)
    exists_in_past_context = @manager.past_context.function_directories.functions[id] != nil

    if exists_in_past_context == false
      puts "Fatal Error: #{id} function doesn't exists."
      exit
    end
  end

  #Title: go_sub
  #Input: func_name
  #Input Description: function name
  #Output Description: Nothing
  #Description: creates gosub quad
  #Author: Victor Elizalde
  def go_sub(func_name)
    quad_number = @manager.past_context.function_directories.functions[func_name].quad_number
    quad = Quadruple.new("GOSUB", func_name, nil, quad_number)
    @manager.add_quad(quad)
    @manager.counter += 1
  end

  #Title: era
  #Input: func_name
  #Input Description: function name
  #Output Description: Nothing
  #Description: creates era quad for functions
  #Author: Victor Elizalde
  def era(func_name)
    return_type = @manager.past_context.function_directories.functions[func_name].return_type
    @ids_and_values_stack.push(func_name)
    @memory_stack.push(func_name)
    @types_stack.push(return_type)
    quad = Quadruple.new("ERA", nil, nil, func_name)
    @manager.add_quad(quad)
    @manager.counter += 1
    @param_index = 0
  end

  #Title: method_parameter
  #Input: var_name, func_name
  #Input Description: variable and function name
  #Output Description: Nothing
  #Description: creates param quad for methods
  #Author: Victor Elizalde
  def method_parameter(var_name, func_name)
    id = @ids_and_values_stack.pop()
    argument = @memory_stack.pop()
    argument_type = @types_stack.pop()
    context = method_exists?(var_name, func_name)
    parameter = context.function_directories.functions[func_name].parameters[@param_index]

    if parameter == nil
      puts "Fatal Error: Parameter #{param_index} doesn't exists #{func_name}."
      exit
    end

    if parameter.type == argument_type
      quad = Quadruple.new("PARAM", argument, nil, "param#{param_index}")
      @manager.add_quad(quad)
      @manager.counter += 1
      @param_index += 1
    else
      puts "Fatal Error: Parameter #{param_index} of value #{id} is expected to be #{argument_type} got #{parameter.type}."
      exit
    end
  end

  #Title: parameter
  #Input: func_name
  #Input Description: function name
  #Output Description: Nothing
  #Description: creates param quad for functions
  #Author: Victor Elizalde
  def parameter(func_name)
    id = @ids_and_values_stack.pop()
    argument = @memory_stack.pop()
    argument_type = @types_stack.pop()

    if @manager.past_context.function_directories.functions[func_name].parameters[@param_index].type == argument_type
      quad = Quadruple.new("PARAM", argument, nil, "param#{param_index}")
      @manager.add_quad(quad)
      @manager.counter += 1
      @param_index += 1
    else
      puts "Fatal Error: Parameter #{param_index} with value #{id} doesn't matches its type."
      exit
    end
  end

  #Title: is_super_expression_pending
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: checks if super expression is pending
  #Author: Victor Elizalde
  def is_super_expression_pending()
    if @operators_stack.last() == "<" || @operators_stack.last() == ">" || @operators_stack.last() == "<=" || @operators_stack.last() == ">=" || @operators_stack.last() == "==" || @operators_stack.last() == "<>"
      produce_quad()
    end
  end

  #Title: method_exists
  #Input: var_name, func_name
  #Input Description: variable and function name
  #Output Description: Nothing
  #Description: Checks if method exists
  #Author: Victor Elizalde
  def method_exists?(var_name, func_name)
    exists_in_current_context = @manager.current_context.variable_directories.variables[var_name] != nil
    exists_in_past_context = @manager.past_context.variable_directories.variables[var_name] != nil

    if exists_in_current_context == true
      var_type = @manager.current_context.variable_directories.variables[var_name].type
    elsif exists_in_past_context == true
      var_type = @manager.past_context.variable_directories.variables[var_name].type
    else
      puts "Fatal Error: #{var_name} variable doesn't exists."
      exit
    end

    class_context = @manager.main_context.class_directories.classes[var_type].context
    exists_in_function_directory = class_context.function_directories.functions[func_name] != nil

    if exists_in_function_directory == false
      puts "Fatal Error: Method #{func_name} doesn't exists for object #{var_name}."
      exit
    end

    class_context
  end

  #Title: variable_exists
  #Input: id
  #Input Description: id of variable
  #Output Description: Nothing
  #Description: checks if variable exists
  #Author: Victor Elizalde
  def variable_exists?(id)
    exists_in_current_context = @manager.current_context.variable_directories.variables[id] != nil
    exists_in_past_context = @manager.past_context.variable_directories.variables[id] != nil
    exists_in_main_context = @manager.main_context.variable_directories.variables[id] != nil

    if exists_in_current_context
      if @manager.current_context.variable_directories.variables[id].is_cte
        puts "Fatal Error: #{id} constant can't be modified."
        exit
      end
    elsif exists_in_past_context
      if @manager.past_context.variable_directories.variables[id].is_cte
        puts "Fatal Error: #{id} constant can't be modified."
        exit
      end
    elsif exists_in_main_context
      if @manager.main_context.variable_directories.variables[id].is_cte
        puts "Fatal Error: #{id} constant can't be modified."
        exit
      end
    end

    if exists_in_main_context == false && exists_in_current_context == false && exists_in_past_context == false
      puts "Fatal Error: #{id} variable doesn't exists."
      exit
    end
  end

  private

  #Title: extract_value
  #Input: value
  #Input Description: value to extract
  #Output Description: Nothing
  #Description: converts value to ruby types
  #Author: Victor Elizalde
  def extract_value(value)
    if value == "verdadero"
      true
    elsif value == "falso"
      false
    elsif value.include? "."
      value.to_f
    elsif value.scan(/\D/).empty?
      value.to_i
    else
      value
    end
  end

  #Title: match_value
  #Input: value
  #Input Description: value type
  #Output Description: Nothing
  #Description: Gets value type
  #Author: Victor Elizalde
  def match_value(value)
    value = value.to_s

    if value == "verdadero" || value == "falso"
      "estado"
    elsif value.include? "."
      "cortable"
    elsif value.scan(/\D/).empty?
      "nocortable"
    else
      "nombre"
    end
  end

  #Title: produce_quad
  #Input:
  #Input Description: Nothing
  #Output Description: Nothing
  #Description: quad for most logical and mathematical operations
  #Author: Victor Elizalde
  def produce_quad()
    operator = @operators_stack.pop()
    @ids_and_values_stack.pop()
    second_col = @memory_stack.pop()
    second_col_type = @types_stack.pop()
    @ids_and_values_stack.pop()
    first_col = @memory_stack.pop()
    first_col_type = @types_stack.pop()
    type_res = @sem_cube.cube[[first_col_type, second_col_type, operator]]

    if type_res != nil
      @manager.set_memory_next()
      temp = @manager.memory_counter
      quad = Quadruple.new(operator, first_col, second_col, temp)
      @manager.add_quad(quad)
      @ids_and_values_stack.push(temp)
      @memory_stack.push(temp)
      @types_stack.push(type_res)
      current_context = @manager.current_context
      current_context.variable_directories.new_variable(temp, type_res, @manager.memory_counter)
      @manager.counter += 1
    else
      puts "Fatal Error: Semantic cube error, received #{first_col} and #{second_col}."
      exit
    end
  end
end
