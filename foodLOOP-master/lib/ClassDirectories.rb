require_relative "ObjectClass"

class ClassDirectories
  attr_accessor :classes

#Title: initialize
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: It initializes the variables for a Class Directory
#Author: Victor Elizalde
  def initialize() #method
    @classes = {}
  end

#Title: new_class
#Input: name, inherits_of, context
#Input Description: name of the class, the parent of it and the context
#Output Description: Nothing
#Description: Creates new class
#Author: Victor Elizalde
  def new_class(name, inherits_of, context) #method
    @classes[name] = ObjectClass.new(name, inherits_of, context)
  end

#Title: print_classes
#Input: Nothing
#Input Description: Nothing
#Output Description: Nothing
#Description: Print all the class directories
#Author: Victor Elizalde
  def print_classes() #method
    puts "Class directories:"
    @classes.each do |key, food_class|
      puts "---------------------------start class-----------------------------------"
      puts "#{food_class.name}:"
      puts("Name: #{food_class.name}, Inherits Of: #{food_class.inherits_of}, Context: #{food_class.context.name}|")
      puts "----------------------------end class-----------------------------------"
    end
  end
end
