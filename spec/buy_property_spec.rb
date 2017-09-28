require_relative 'spec_helper'

describe 'buy property' do

  it 'players who land on an unowned property automatically buy it' do
    rich = rich_about_to_land_in_a_property
    initial_balance = rich.balance
    cost = 60

    game = Game.new(rich, rich)

    game.next_turn

    expect(rich.owns?(rich.where)).to be true
    expect(rich.balance).to eq(initial_balance - cost)
  end

  it 'player who lands on an property owned does not buy it' do
    game = Game.new(rich_about_to_land_in_a_property, rich_about_to_land_in_a_property)
    owner = game.next_turn
    
    player = game.next_turn
    
    expect(player.owns?(player.where)).to be false
  end

  it 'player who passes over an unowned property does not buy it' do
    player = TestPlayer.rich
    player.moves(5)
    initial_balance = player.balance

    game = Game.new(player, player)

    game.next_turn

    expect(player.balance).to eq(initial_balance)
  end

  def rich_about_to_land_in_a_property
    rich = TestPlayer.rich
    rich.locate('Go')
    rich.moves(3)
    rich
  end
end