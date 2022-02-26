require_relative 'piece'

class Player
  attr_accessor :name
  attr_reader :color
  
  def initialize(name=nil, color)
    @name = name
    @color = color
  end
end