class Player
  attr_reader :name, :hit_points

  def initialize(name, hit_points = 100)
    @name = name
    @hit_points = hit_points
  end

  def reduce_hp
    @hit_points -= 10
  end

  def dead?
    @hit_points == 0
  end

end