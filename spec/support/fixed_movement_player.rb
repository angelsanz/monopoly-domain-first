require_relative '../../src/player'

class FixedMovementPlayer < Player
  def initialize
    super()
    @steps_moved = 7
  end

  def locate(location)
    @location = location
  end

  def moves(steps)
    @steps_moved = steps
  end

  def roll
    @steps_moved
  end
end