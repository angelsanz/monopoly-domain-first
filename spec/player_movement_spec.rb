require_relative '../src/player'
require_relative './support/fixed_movement_player'

describe 'Player movement' do
  it 'starts on beginning location' do
    beginning = 'Go'
    player = Player.new

    expect(player.where).to eq(beginning)
  end

  it 'advances the quantity rolled' do
    player = FixedMovementPlayer.new

    player.move()

    expect(player.where).to eq('South Chance')
  end

  it 'goes around the board' do
    player = FixedMovementPlayer.new
    player.locate('Boardwalk')

    player.move()

    expect(player.where).to eq('Oriental Avenue')
  end

  it 'moves the sum of rolling two dice' do
    player = Player.new

    player.move()

    allowed_positions = ['Go','Mediterranean Avenue','South Community Chest',
    'Baltic Avenue','Income Tax','Readind Railroad',
    'Oriental Avenue','South Chance','Vermont Avenue',
    'Connecticut Avenue','Just Visiting','St Charles Place',
    'Electric Company']

    expect(allowed_positions).to include(player.where)
  end
end

