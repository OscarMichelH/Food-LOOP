require_relative "DimensionGenerator"

class ObjectVariable
  attr_accessor :name, :type, :value, :has_dim, :dim_objs, :size, :memory_dir, :is_cte

#Title: initialize
#Input: name, type, memory, is_cte
#Input Description: Variable name, type, memory direction, if its constant
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize(name, type, memory, is_cte) #method
    @memory_dir = memory
    @dim_objs = []
    @name = name
    @type = type
    @is_cte = is_cte
  end
end
