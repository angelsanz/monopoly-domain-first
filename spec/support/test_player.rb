require_relative '../../src/player'

class TestPlayer < Player
  def self.loser
    player = new
    player.charge(1)
    player
  end

  def self.avoiding_luxury_tax_player
    player = new
    player.moves(5)
    player
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