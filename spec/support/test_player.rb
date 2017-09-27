require_relative '../../src/player'

class TestPlayer < Player
  def self.loser
    player = new
    player.charge(1)
    player
  end

  def self.not_loser
    player = new
    player.receive(INFINITE_MONEY)
    player
  end
  INFINITE_MONEY = 1_000_000_000

  def self.avoiding_luxury_tax
    player = new
    player.moves(5)
    player
  end

  def self.with_fixed_seven_movement
    new
  end

  def initialize(name = '')
    super()
    @steps_moved = 7
    @name = name
  end

  def name
    @name
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