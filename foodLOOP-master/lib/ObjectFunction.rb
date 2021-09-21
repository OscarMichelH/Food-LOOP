require_relative "ObjectVariable"
require_relative "Manager"

class ObjectFunction
  attr_accessor :header, :parameters, :return_type, :quad_number

#Title: initialize
#Input: header, parameters, return_type, quad_number
#Input Description: header, parameters, return type, quad number
#Output Description: Nothing
#Description: Initializes variables
#Author: Victor Elizalde
  def initialize(header, parameters, return_type, quad_number) #method
    @parameters = digest_params(parameters)
    @return_type = return_type
    @quad_number = quad_number
    @header = header
  end

#Title: digest_params
#Input: params
#Input Description: parameters
#Output Description: returns parameters declared as variables
#Description: puts the parameters in the correct format to read it
#Author: Victor Elizalde
  def digest_params(params) #method
    vars = []
    params = params.tr('()', '').split(',')

    params.each do |param|
      param = param.split(' ')
      var = ObjectVariable.new(param[1], param[0], 0, false)
      vars.push(var)
    end

    vars
  end
end
