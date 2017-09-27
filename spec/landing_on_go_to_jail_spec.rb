require_relative '../src/game'
require_relative './support/fixed_movement_player'

describe 'Landing on Go To Jail' do
  it 'landing on Go To Jail ends up on Just Visiting' do
    player = FixedMovementPlayer.new
    player.locate('Indiana Avenue')

    game = Game.new(player, player)
    game.next_turn

    expect(player.where).to eq('Just Visiting')
  end

  it 'landing on Go To Jail does not change the balance' do
    player = FixedMovementPlayer.new
    player.locate('Indiana Avenue')

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end

  it 'passing over Go To Jail does not change the balance' do
    player = FixedMovementPlayer.new
    player.locate('Illinois Avenue')

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end
end