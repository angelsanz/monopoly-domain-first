require_relative 'spec_helper'

describe 'Landing on Go' do
  it 'the balance of a player landing on Go increase by $200' do
    bonus = 200
    player = TestPlayer.new
    player.locate('East Community Chest')
    
    game = Game.new(player, player)

    expect{game.next_turn}.to change{player.balance}.by(bonus)
  end

  it 'a player landing on a normal location dont change balance' do
    player = Player.new
    
    game = Game.new(player, player)

    expect{game.next_turn}.not_to change{player.balance}
  end
end