require_relative '../src/game'
require_relative '../src/player'
require_relative './support/fixed_movement_player'

describe 'Winning Mechanics' do
  it 'a player loses when his balance is below zero' do
    competitor_one = FixedMovementPlayer.avoiding_luxury_tax_player
    competitor_two = FixedMovementPlayer.avoiding_luxury_tax_player
    loser = FixedMovementPlayer.loser
    
    game = Game.new(loser, competitor_one, competitor_two)

    turns = []
    until game.finished?
      turns << game.next_turn
    end

    expect(turns).not_to include(loser)
  end

  it 'a player wins when every other player has lost' do
    winner = Player.new
    loser = FixedMovementPlayer.loser

    game = Game.new(loser, winner)

    expect{ play_a_round(game) }.to raise_error('We got a winner!')
  end

  it 'a player wins when every other player has lost' do
    winner = Player.new
    loser = FixedMovementPlayer.loser
    another_loser = Player.new

    game = Game.new(loser, winner, another_loser)

    expect{ play_a_round(game) }.not_to raise_error('We got a winner!')

    make_lose(another_loser)

    expect{ play_a_round(game) }.to raise_error('We got a winner!')
  end

  def make_lose(player)
    player.charge(100)
  end

  def play_a_round(game)
    game.next_turn
    game.next_turn
    game.next_turn 
  end
end