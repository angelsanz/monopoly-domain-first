require_relative '../../src/player'

class FixedMovementPlayer < Player
  STEPS_MOVED = 7

  def locate(location)
    @location = location
  end

  def roll
    STEPS_MOVED
  end
end