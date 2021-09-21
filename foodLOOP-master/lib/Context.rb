require_relative "VariableDirectories"
require_relative "FunctionDirectories"
require_relative "ClassDirectories"

class Context
  attr_accessor :class_directories, :function_directories, :variable_directories, :name

#Title: initialize
#Input: name, context_type = ""
#Input Description: name of context, type of context (it can be nil)
#Output Description: Nothing
#Description: Initializes Context variables
#Author: Victor Elizalde
  def initialize(name, context_type = "") #method
    @name = name

    case context_type
    when "receta"
      @variable_directories = VariableDirectories.new()
    when "platillo"
      @variable_directories = VariableDirectories.new()
      @function_directories = FunctionDirectories.new()
    else
      @variable_directories = VariableDirectories.new()
      @function_directories = FunctionDirectories.new()
      @class_directories = ClassDirectories.new()
    end
  end

#Title: print_tables
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Print context classes, funtions and variables
#Author: Victor Elizalde
  def print_tables()
    if @class_directories != nil
      @class_directories.print_classes()
    end

    if @function_directories != nil
      @function_directories.print_functions()
    end

    @variable_directories.print_variables()
  end
end
