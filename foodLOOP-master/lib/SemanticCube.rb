class SemanticCube
  attr_accessor :cube

#Title: initialize
#Input: ()
#Input Description: Nothing
#Output Description: Cube Built
#Description: Initializes variables and call main function
#Author: Victor Elizalde
  def initialize #method
    @cube = {}
    create_cube()
  end

#Title: create_cube
#Input:
#Input Description: Nothing
#Output Description: Nothing
#Description: Calls math function and logical operators functions
#Author: Victor Elizalde
  def create_cube() #method
    ["nocortable", "cortable", "nombre", "estado", "proceso"].each do |data_type|
      logic_operators(data_type)
      @cube[[data_type, data_type, "="]] = data_type
    end
    ["nocortable", "cortable"].each do |data_type|
      math_operators(data_type)
    end
    @cube[["nocortable", "cortable", "="]] = "cortable"
    @cube[["nombre", "nombre", "+"]] = "nombre"
  end

#Title: logic_operators
#Input: data_type
#Input Description: data type
#Output Description: Nothing
#Description: fills logical operators
#Author: Victor Elizalde
  def logic_operators(data_type) #method
    ["<", ">", "<=", ">=", "==", "<>", "&&", "||"].each do |logic_type|
      @cube[[data_type, data_type, logic_type]] = "estado"
    end
  end

#Title: math_operators
#Input: data_type
#Input Description: data type
#Output Description: Nothing
#Description: fills math operators
#Author: Victor Elizalde
  def math_operators(data_type) #method
    ["+", "-", "*"].each do |math_index|
      @cube[[data_type, data_type, math_index]] = data_type
    end
    ["+", "-", "*"].each do |math_index|
      opposite_data_type = data_type == "nocortable" ? "cortable" : "nocortable"
      @cube[[data_type, opposite_data_type, math_index]] = "cortable"
    end
    @cube[[data_type, data_type, "/"]] = "cortable"
  end
end
