require_relative "Manager"
require_relative "ObjectDimension"

class DimensionGenerator
#Title: initialize
#Input: manager
#Input Description: Manager
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize(manager) #method
    @manager = manager
    @r = 1
  end

#Title: get_variable
#Input: id
#Input Description: id of variable to find
#Output Description: the variable object
#Description: returns variable object
#Author: Victor Elizalde
  def get_variable(id) #method
    @manager.current_context.variable_directories.variables[id]
  end

#Title: get_dim_obj
#Input: id
#Input Description: id of dim object to find
#Output Description: the dim objects of the variable
#Description: Returns the dim objects of the variable
#Author: Victor Elizalde
  def get_dim_obj(id) #method
    @manager.current_context.variable_directories.variables[id].dim_objs
  end

#Title: calculate_r
#Input: limit
#Input Description: the limit of the array or matrix
#Output Description: the new value of R
#Description: calculates the new R and returns it
#Author: Victor Elizalde
  def calculate_r(limit) #method
    @r * (limit + 1)
  end

#Title: reset_r
#Input: 
#Input Description: Nothing
#Output Description: The new R with value 1
#Description: Resets the value of R
#Author: Victor Elizalde
  def reset_r() #method
    @r = 1
  end

#Title: new_dimension
#Input: id
#Input Description: id of the variable that will receive a new dimension
#Output Description: the array of dim objects with the new dim object
#Description: creates new object dimension and pushes it to the dimension objects of the variable
#Author: Victor Elizalde
  def new_dimension(id) #method
    dim_obj = ObjectDimension.new()
    get_dim_obj(id).push(dim_obj)
  end

#Title: add_limit
#Input: id, limit
#Input Description: id of variable and limit of it
#Output Description: the new R with the new limit
#Description: assignates the limit to the last dim object of the variable and calculates the new R
#Author: Victor Elizalde
  def add_limit(id, limit) #method
    limit = limit.to_i - 1
    get_dim_obj(id).last().limit = limit
    @r = calculate_r(limit)
  end

#Title: calculate_m
#Input: id
#Input Description: id of variable to calculate m
#Output Description: the value of m of the last dim object
#Description: calculates M for each object and updates R
#Author: Victor Elizalde
  def calculate_m(id) #method
    get_variable(id).size = @r
    @manager.memory_counter += @r - 1
    get_dim_obj(id).each do |obj|
      obj.m = @r / (obj.limit + 1)
      @r = obj.m
    end
    get_dim_obj(id).last().m = 1
  end
end
