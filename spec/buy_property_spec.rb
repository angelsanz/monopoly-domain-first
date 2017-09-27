describe 'buy property' do
  it 'players who land on an unowned property automatically buy it' do
    property = 'Baltic Avenue'
    cost = 60
    player = TestPlayer.new
    player.receive(100)
    player.locate('Go')
    player.moves(3)
    game = Game.new(player, Player.new)

    game.next_turn
    game.next_turn

    expect(player.balance).to eq(40)
    expect(player.owns?(property)).to be true
  end

  it 'player who lands on an property he owns does not buy it again' do
    player = TestPlayer.new
    player.receive(100)
    player.locate('Go')
    player.moves(3)
    game = Game.new(player, TestPlayer.avoiding_luxury_tax)

    game.next_turn
    game.next_turn

    initial_balance = player.balance
    player.locate('Go')
    player.moves(3)

    game.next_turn
    game.next_turn

    expect(player.balance).to eq(initial_balance)
  end

  it 'player who passes over an unowned property does not buy it' do
    player = TestPlayer.new
    initial_balance = 100
    player.receive(initial_balance)
    player.locate('Go')
    player.moves(5)

    game = Game.new(player, TestPlayer.avoiding_luxury_tax)

    game.next_turn
    game.next_turn

    expect(player.balance).to eq(initial_balance)
  end
end