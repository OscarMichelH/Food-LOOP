require_relative "ObjectFunction"

class FunctionDirectories
  attr_accessor :functions

#Title: initialize
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize() #method
    @functions = {}
  end

#Title: new_function
#Input: header, parameters = nil, return_type, quad_number
#Input Description: header, parameters(if not received is nil), return type, quad number
#Output Description: new object Function
#Description: Creates new object function in function directory
#Author: Victor Elizalde
  def new_function(header, parameters = nil, return_type, quad_number) #method
    @functions[header] = ObjectFunction.new(header, parameters, return_type, quad_number)
  end

#Title: print_functions
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Prints Function directory
#Author: Victor Elizalde
  def print_functions() #method
    puts "Functions directory:"
    @functions.each do |key, food_function|
      puts "-------------------start function-----------------------"
      puts "#{food_function.header}"
      puts("|Header: #{food_function.header}, Parameters: #{food_function.parameters.map { |e| e.name }}, Return Type: #{food_function.return_type}, Quad Jump: #{food_function.quad_number}|")
      puts "--------------------end function------------------------"
    end
  end
end
