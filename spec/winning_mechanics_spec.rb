require_relative 'spec_helper'

describe 'Winning Mechanics' do
  it 'a player loses when his balance is below zero' do
    competitor_one = TestPlayer.avoiding_luxury_tax
    competitor_two = TestPlayer.avoiding_luxury_tax
    loser = TestPlayer.loser

    game = Game.new(loser, competitor_one, competitor_two)

    turns = []
    until game.finished?
      turns << game.next_turn
    end

    expect(turns).not_to include(loser)
  end

  it 'a player wins when every other player has lost' do
    winner = TestPlayer.not_loser
    loser = TestPlayer.loser
    players = [loser, winner]

    game = Game.new(*players)

    expect{ play_a_round(game, players.size) }.to raise_error('We got a winner!')
  end

  it 'a player wins when every other player has lost' do
    winner = TestPlayer.not_loser
    loser = TestPlayer.loser
    loser_wannabe = TestPlayer.new
    players = [loser, winner, loser_wannabe]

    game = Game.new(*players)

    expect{ play_a_round(game, players.size) }.not_to raise_error('We got a winner!')

    make_lose(loser_wannabe)

    expect{ play_a_round(game, players.size) }.to raise_error('We got a winner!')
  end

  def make_lose(player)
    player.charge(player.balance + 1)
  end

  def play_a_round(game, turns)
    turns.times do
      game.next_turn
    end
  end
end