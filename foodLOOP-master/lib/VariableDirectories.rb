require_relative "ObjectVariable"

class VariableDirectories
  attr_accessor :variables

#Title: initialize
#Input: 
#Input Description: Nothing
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize() #method
    @variables = {}
  end

#Title: get_variable
#Input: id
#Input Description: id of variable to get
#Output Description: returns variable object
#Description: It find the variable and returns it
#Author: Victor Elizalde
  def get_variable(id) #method
    @variables[id]
  end

#Title: variable_exists?
#Input: id
#Input Description: id of variable to check
#Output Description: true or false depending if the variable exists
#Description: Checks if variable exists
#Author: Victor Elizalde
  def variable_exists?(id) #method
    @variables.key?(id)
  end

#Title: new_variable
#Input: name, type, memory, is_cte = false
#Input Description: name of variable, type, memory direction, is constant(optional)
#Output Description: new variable
#Description: Creates new variable
#Author: Victor Elizalde
  def new_variable(name, type, memory, is_cte = false) #method
    @variables[name] = ObjectVariable.new(name, type, memory, is_cte)
  end

#Title: print_variables
#Input: 
#Input Description: Nothing
#Output Description: Nothing
#Description: Prints the info of the variables
#Author: Victor Elizalde
  def print_variables() #method
    puts "Variables directory:"
    @variables.each do |key, variable|
      puts "------------------------------------------------------"
      puts("|Name: #{variable.name}, Type: #{variable.type}, Size: #{variable.size}, Dir: #{variable.memory_dir}, Dim Obj: #{variable.dim_objs}|")
      puts "------------------------------------------------------"
    end
  end
end
