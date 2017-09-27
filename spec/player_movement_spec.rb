require_relative 'spec_helper'

describe 'Player movement' do
  it 'starts on beginning location' do
    beginning = 'Go'
    player = Player.new

    expect(player.where).to eq(beginning)
  end

  it 'advances the quantity rolled' do
    player = TestPlayer.with_fixed_seven_movement

    player.move()

    expect(player.where).to eq('South Chance')
  end

  it 'goes around the board' do
    player = TestPlayer.with_fixed_seven_movement
    player.locate(JUST_BEFORE_BOARD_END)

    player.move()

    expect(player.where).to eq(PAST_BOARD_BEGINNING)
  end

  it 'moves the sum of rolling two dice' do
    player = Player.new

    player.move()

    reachable_locations = ['Mediterranean Avenue','South Community Chest',
    'Baltic Avenue','Income Tax','Readind Railroad',
    'Oriental Avenue','South Chance','Vermont Avenue',
    'Connecticut Avenue','Just Visiting','St Charles Place',
    'Electric Company']

    expect(reachable_locations).to include(player.where)
  end

  JUST_BEFORE_BOARD_END = 'Boardwalk'
  PAST_BOARD_BEGINNING = 'Oriental Avenue'
end

