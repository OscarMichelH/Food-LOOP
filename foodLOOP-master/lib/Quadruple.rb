class Quadruple
  attr_accessor :operator, :first_col, :second_col, :result

#Title: initialize
#Input: operator, first_col, second_col, result
#Input Description: operator, first value, second value and result
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize(operator, first_col, second_col, result) #method
    @second_col = second_col
    @first_col = first_col
    @operator = operator
    @result = result
  end
end
