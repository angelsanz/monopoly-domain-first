require_relative '../src/round'

describe Round do
  it 'is finished after all players play' do
    round = Round.new([:player_one, :player_two, :player_three])

    round.next_player
    round.next_player
    round.next_player

    expect(round.played).to eq(1)
  end

  it 'can eliminate a player' do
    round = Round.new([:player_one, :player_two])

    round.eliminate(:player_one)

    expect(round.next_player).to eq(round.next_player)
  end

  it 'eliminated players never play again' do
    players = [:player_one, :player_two, :player_three]
    round = Round.new(players)
    eliminated_player = :player_one

    round.eliminate(eliminated_player)

    current_players = []
    players.size.times do
        current_players << round.next_player
    end

    expect(current_players).not_to include(eliminated_player)
  end

  it 'is consistent after next player is eliminated' do
    round = Round.new([:player_one, :player_two, :player_three])
    round.next_player

    next_player = :player_two
    round.eliminate(next_player)

    expect(round.next_player).to eq(:player_three)
    expect(round.played).to eq(1)
  end

  it 'finishes when all remaining players are eliminated' do
    round = Round.new([:player_one, :player_two, :player_three])

    round.next_player
    round.eliminate(:player_two)
    round.eliminate(:player_three)

    expect(round.played).to eq(1)
  end

  it 'is consistent after the player who just played is eliminated' do
    round = Round.new([:player_one, :player_two, :player_three])
    player_who_just_played = round.next_player

    round.eliminate(player_who_just_played)

    expect(round.next_player).to eq(:player_two)
    expect(round.next_player).to eq(:player_three)
    expect(round.played).to eq(1)
  end
end