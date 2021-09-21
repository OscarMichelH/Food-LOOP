class ObjectClass
  attr_accessor :name, :inherits_of, :context

#Title: initialize
#Input: name, inherits_of, context
#Input Description: name of class, parent, context
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize(name, inherits_of, context) #method
    @inherits_of = inherits_of
    @context = context
    @name = name
  end
end
