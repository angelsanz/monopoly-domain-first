require_relative '../src/player'

describe 'Player movement' do
  it 'starts on beginning location' do
    beginning = '0'
    player = Player.new

    expect(player.where).to eq(beginning)
  end

  it 'advances the quantity rolled' do
    player = FixedMovementPlayer.new

    player.move()

    expect(player.where).to eq('7')
  end

  it 'goes around the board' do
    player = FixedMovementPlayer.new
    player.locate('39')

    player.move()

    expect(player.where).to eq('6')
  end

  it 'moves the sum of rolling two dice' do
    player = Player.new

    player.move()

    allowed_positions = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']

    expect(allowed_positions).to include(player.where)
  end

  class FixedMovementPlayer < Player
    STEPS_MOVED = 7

    def locate(location)
      @location = location
    end

    def roll
      STEPS_MOVED
    end
  end
end

