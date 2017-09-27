require_relative 'spec_helper'

describe 'Passing over Go' do
  ABOUT_TO_PASS_OVER_GO = 'Boardwalk'

  it 'when passing over Go receive bonus' do
    bonus = 200
    player = TestPlayer.with_fixed_seven_movement
    player.locate(ABOUT_TO_PASS_OVER_GO)

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{player.balance}.by(bonus)
  end

  it 'when moving from Go dont receive bonus' do
    player = TestPlayer.with_fixed_seven_movement
    player.locate('Go')

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{player.balance}
  end
end