require_relative '../src/game'
require_relative './support/fixed_movement_player'

describe 'Game players' do
  it 'game needs two players in order to start' do
    expect {
      Game.new(:player_one)
    }.to raise_error(ArgumentError)
  end

  it 'game has at maximum eight players' do
    players = [ :player_one, :player_two, :player_three, :player_four,
      :player_five, :player_six, :player_seven, :player_eight, :player_nine ]

    expect {
      Game.new(*players)
    }.to raise_error(ArgumentError)
  end

  it 'game with two players' do
    horse = Player.new
    car = Player.new
    players = [horse, car]
    game = Game.new(*players)

    expect(players).to include(game.next_turn)
    expect(players).to include(game.next_turn)
  end

  it 'game has an initial random ordering of players' do
    who_started_game = []
    statistically_significant_number = 100

    statistically_significant_number.times do
      first = FixedMovementPlayer.new('first')
      last = FixedMovementPlayer.new('last')
      who_started_game << Game.new(first, last).next_turn.name
    end

    expect(who_started_game).to include('last')
    expect(who_started_game).to include('first')
  end
end