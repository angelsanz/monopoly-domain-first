require_relative 'board'
require_relative 'dice'

class Player
  def initialize
    @location = board.beginning
    @dice = SixSidedDice.new
    @balance = 0
    @properties = []
  end

  def where
    @location
  end

  def send_to(location)
    @location = location
  end

  def move
    advance(roll)
  end

  def balance
    @balance
  end

  def receive(amount)
    @balance += amount
  end

  def charge(amount)
    @balance -= amount
  end

  def buy(cost)
    charge(cost)
    @properties << where
  end

  def owns?(property)
    @properties.include?(property)
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