require_relative 'board'
require_relative 'dice'

class Player
  BOARD_SIZE = 40

  def initialize
    @location = board.beginning
    @dice = SixSidedDice.new
  end

  def where
    @location
  end

  def move
    advance(roll)
  end

  private

  def advance(steps)
    @location = board.travel(@location, steps)
  end

  def roll
    @dice.roll + @dice.roll
  end

  def board
    Board
  end
end