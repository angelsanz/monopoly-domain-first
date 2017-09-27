require_relative 'spec_helper'

describe 'Landing on luxury tax' do
  ABOUT_TO_LAND_ON_LUXURY_TAX = 'Pacific Avenue'
  ABOUT_TO_PASS_OVER_LUXURY_TAX = 'North Carolina Avenue'

  it 'landing on Luxury Tax decreases balance by $75' do
    tax = 75
    player = TestPlayer.with_fixed_seven_movement
    player.locate(ABOUT_TO_LAND_ON_LUXURY_TAX)

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'passing over Luxury Tax does not change the balance' do
    player = TestPlayer.with_fixed_seven_movement
    player.locate(ABOUT_TO_PASS_OVER_LUXURY_TAX)

    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end
end