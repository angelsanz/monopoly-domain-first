require_relative 'spec_helper'


describe 'Landing on Income Tax' do
  it 'with a total worth of $1800 the balance decreases by $180' do
    tax = 180
    player = player_about_to_land_on_income_tax
    player.receive(1800)

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'with a total worth of $0 the balance decreases by $0' do
    tax = 0
    player = player_about_to_land_on_income_tax

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'with a total worth of $2000 the balance decreases by $200' do
    tax = 200
    player = player_about_to_land_on_income_tax
    player.receive(2000)

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'with a total worth of $2200 the balance decreases by $200' do
    tax = 200
    player = player_about_to_land_on_income_tax
    player.receive(2200)

    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'passing over "Income Tax" dont change balance' do
    player = player_about_to_pass_over_income_tax
    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end

  def player_about_to_land_on_income_tax
    player = TestPlayer.new
    player.moves(1)
    player.locate('Baltic Avenue')
    player
  end

  def player_about_to_pass_over_income_tax
    player = TestPlayer.new
    player.locate('Baltic Avenue')
    player
  end
end