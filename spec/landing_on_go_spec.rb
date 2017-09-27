require_relative 'spec_helper'

describe 'Landing on Go' do
  ABOUT_TO_LAND_ON_GO = 'East Community Chest'

  it 'the balance of a player landing on Go increase by $200' do
    bonus = 200
    player = TestPlayer.with_fixed_seven_movement
    player.locate(ABOUT_TO_LAND_ON_GO)

    game = Game.new(player, player)

    expect{game.next_turn}.to change{player.balance}.by(bonus)
  end

  it 'the balance of a player not landing on Go does not change' do
    player = TestPlayer.with_fixed_seven_movement

    game = Game.new(player, player)

    expect{game.next_turn}.not_to change{player.balance}
  end
end