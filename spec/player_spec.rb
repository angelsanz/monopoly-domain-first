require_relative '../src/player'
require_relative '../src/dice'

describe 'Player' do
  describe 'roll' do
    it 'uses two dice' do
      player = Cheater.new
      dice = SpiedDice.new
      player.use(dice)

      player.move()

      expect(dice).to have_been_rolled(2)
    end
  end

  class Cheater < Player
    def use(dice)
      @dice = dice
    end
  end

  class SpiedDice < SixSidedDice
    def initialize
      @rolled = 0
    end

    def roll
      @rolled += 1
    end

    def has_been_rolled?(times)
      @rolled == times
    end
  end
end

