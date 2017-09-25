require_relative '../src/game'

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
    game = Game.new(:horse, :car)

    expect(game.is_playing?(:horse)).to be true
    expect(game.is_playing?(:car)).to be true
    expect(game.is_playing?(:random_player)).to be false
  end

  it 'game has an initial random ordering of players' do
    result = []
    statistically_significant_number = 100

    statistically_significant_number.times do
      result << Game.new(:first, :last).next_turn
    end

    expect(result).to include(:last)
  end
end