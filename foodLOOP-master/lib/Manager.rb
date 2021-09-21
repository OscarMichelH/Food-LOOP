require_relative "Context"
require_relative "VirtualMachine"

class Manager
  attr_accessor :main_context, :current_context, :quadruples, :past_context, :memory_counter, :counter

#Title: initialize
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize() #method
    @main_context = Context.new("Global")
    @current_context = @main_context
    @past_context = @main_context
    @memory_counter = 5000
    @quadruples = []
    @counter = 0
  end

#Title: set_memory_next
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Increases memory direction
#Author: Victor Elizalde
  def set_memory_next() #method
    @memory_counter += 1
  end

#Title: add_quad
#Input: quad
#Input Description: quadruple already built
#Output Description: Nothing
#Description: Adds quadruple to list of quadruples
#Author: Victor Elizalde
  def add_quad(quad) #method
    @quadruples.push(quad)
  end

#Title: reset_context
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Returns to past context
#Author: Victor Elizalde
  def reset_context() #method
    # puts "\n--- Function #{@current_context.name} ---\n"
    # @current_context.print_tables()
    @current_context = @past_context
  end

#Title: reset_class_context
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Sets context to main
#Author: Victor Elizalde
  def reset_class_context() #method
    @current_context = @main_context
  end

#Title: finish
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Finished quadruples and starts Virtual Machine
#Author: Victor Elizalde
  def finish() #method
    print_quadruples()
    puts "Ingredients retrieved succesfully."
    VirtualMachine.new(@quadruples)
  end

#Title: add_dim_variable
#Input: name, type, has_dim
#Input Description: name, type, boolean if it has dimension
#Output Description: Nothing
#Description: Adds new dimensional variable
#Author: Victor Elizalde
  def add_dim_variable(name, type, has_dim) #method
    add_variable(name, type)
    @current_context.variable_directories.variables[name].has_dim = has_dim
  end

#Title: add_constant
#Input: name, type
#Input Description: name and type of variable
#Output Description: Nothing
#Description: Adds variable or constant and checks if it already exists
#Author: Victor Elizalde
  def add_constant(name, type) #method
    if @current_context.variable_directories.variables[name] != nil
      puts "Fatal Error: redefinition of constant #{name}."
      exit
    else
      @current_context.variable_directories.new_variable(name, type, @memory_counter, true)
      set_memory_next()
    end
  end

#Title: add_variable
#Input: name, type
#Input Description: name and type of variable
#Output Description: Nothing
#Description: Adds variable or constant and checks if it already exists
#Author: Victor Elizalde
  def add_variable(name, type) #method
    if @current_context.variable_directories.variables[name] != nil
      puts "Fatal Error: redefinition of variable #{name}."
      exit
    else
      @current_context.variable_directories.new_variable(name, type, @memory_counter, false)
      set_memory_next()
    end
  end

#Title: add_class
#Input: name, inherits_of
#Input Description: name of class and parent
#Output Description: Nothing
#Description: Adds class to context
#Author: Victor Elizalde
  def add_class(name, inherits_of) #method
    if @current_context.class_directories.classes[name] != nil
      puts "Fatal Error: redefinition of class #{name}."
      exit
    else
      @current_context.class_directories.new_class(name, inherits_of, Context.new("#{name} context", "platillo"))
      @current_context = @current_context.class_directories.classes[name].context
    end
  end

#Title: add_function
#Input: header, parameters, return_type
#Input Description: header, parameters, return type
#Output Description: Nothing
#Description: Adds new function and checks if it already exists
#Author: Victor Elizalde
  def add_function(header, parameters, return_type) #method
    if @current_context.function_directories.functions[header] != nil
      puts "Fatal Error: redefinition of function #{header}."
      exit
    else
      @current_context.function_directories.new_function(header, parameters, return_type, @quadruples.count)
      params = @current_context.function_directories.functions[header].parameters
      @past_context = @current_context
      @current_context = Context.new("#{header} context", "receta")
      params.each_with_index do | param , index |
        set_memory_next()
        @current_context.variable_directories.new_variable(param.name, param.type, @memory_counter)
        quad = Quadruple.new("=", "param#{index}", nil, @memory_counter)
        add_quad(quad)
        @counter += 1
      end
    end
  end

#Title: inherits_class_context
#Input: parent_class
#Input Description: parent class
#Output Description: Nothing
#Description: Clones parent context to current one
#Author: Victor Elizalde
  def inherits_class_context(parent_class) #method
    parent_context = @main_context.class_directories.classes[parent_class].context
    @current_context.function_directories.functions = parent_context.function_directories.functions.clone
    @current_context.variable_directories.variables = parent_context.variable_directories.variables.clone
  end

#Title: print_quadruples
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Prints all quadruples
#Author: Victor Elizalde
  def print_quadruples() #method
    puts "\n--- Global Context ---\n"
    @main_context.print_tables()
    puts "----------------------------------------------"
    @quadruples.each_with_index do |quad, index|
      puts "#{index}\t|#{quad.operator}\t|#{quad.first_col}\t|#{quad.second_col}\t|#{quad.result}"
    end
    puts "----------------------------------------------"
  end
end
