require_relative 'spec_helper'

describe 'Passing over go' do
  it 'when passing over go receive bonus' do
    bonus = 200
    player = FixedMovementPlayer.new
    player.locate('Boardwalk')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.to change{player.balance}.by(bonus)
  end

  it 'when starts at "Go" dont receive bonus' do
    player = FixedMovementPlayer.new
    player.locate('Go')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{player.balance}
  end
end