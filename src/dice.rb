class Dice
  MINIMUM = 1
  SIDES = MINIMUM

  def initialize
    raise 'Use a SixSidedDice'
  end

  def roll
    rand(1..SIDES)
  end
end

class SixSidedDice < Dice
  SIDES = 6

  def initialize
  end
end