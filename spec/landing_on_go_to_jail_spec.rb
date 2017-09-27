require_relative '../src/game'
require_relative './support/fixed_movement_player'


describe 'Landing on Go To Jail' do
  ABOUT_TO_GO_TO_JAIL = 'Indiana Avenue'
  ABOUT_TO_PASS_OVER_GO_TO_JAIL = 'Illinois Avenue'

  it 'landing on Go To Jail ends up on Just Visiting' do
    player = FixedMovementPlayer.new
    player.locate(ABOUT_TO_GO_TO_JAIL)

    game = Game.new(player, player)
    game.next_turn

    expect(player.where).to eq('Just Visiting')
  end

  it 'landing on Go To Jail does not change the balance' do
    player = FixedMovementPlayer.new
    player.locate(ABOUT_TO_GO_TO_JAIL)

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end

  it 'passing over Go To Jail does not change the balance' do
    player = FixedMovementPlayer.new
    player.locate(ABOUT_TO_PASS_OVER_GO_TO_JAIL)

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end
end