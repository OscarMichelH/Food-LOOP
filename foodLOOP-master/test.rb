require_relative "FoodLOOPLexer"
require_relative "FoodLOOPParser"

input = ANTLR3::FileStream.new("chef_analysis.fl")
parser = open("chef_analysis.fl") { |f| FoodLOOP::Parser.new(f) }
parser.start
