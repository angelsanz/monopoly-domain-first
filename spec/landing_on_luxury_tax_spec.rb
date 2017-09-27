require_relative 'spec_helper'

describe 'Landing on luxury tax' do
  it 'landing on luxury tax decrease balance by $75' do
    tax = 75
    player = TestPlayer.new
    player.locate('Pacific Avenue')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'passing over luxury tax does not change the balance' do
    player = TestPlayer.new
    player.locate('North Carolina Avenue')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end
end