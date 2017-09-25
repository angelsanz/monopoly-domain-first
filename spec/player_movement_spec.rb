require_relative '../src/player'

describe 'Player movement' do
  it 'starts on beginning location' do
    beginning = 0
    player = Player.new

    expect(player.where).to eq(beginning)
  end

  it 'advances the quantity rolled' do
    player = FixedMovementPlayer.new

    player.move()

    expect(player.where).to eq(FixedMovementPlayer::STEPS_MOVED)
  end

  it 'goes around the board' do
    player = FixedMovementPlayer.new
    player.locate(39)

    player.move()

    expect(player.where).to eq(6)
  end

  it 'moves the sum of rolling two dice' do
    player = Player.new

    player.move()

    expect(player.where).to be_between(1, 12)
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

