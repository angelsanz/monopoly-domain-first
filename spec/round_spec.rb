require_relative '../src/round'

describe Round do
  it 'eliminates a player' do
    round = Round.new([:player_one, :player_two])

    round.eliminate(:player_one)

    expect(round.next_player).to eq(round.next_player)
  end

  it 'round is consistent before elimination' do
    round = Round.new([:player_one, :player_two, :player_three])
    round.next_player
    round.next_player
    round.next_player

    expect(round.played).to eq(1)

    round.next_player
    round.eliminate(:player_two)

    expect(round.next_player).to eq(:player_three)

    expect(round.played).to eq(2)

    round.next_player
    round.next_player
    expect(round.played).to eq(3)
  end

  it 'round is consistent before elimination 3' do
    round = Round.new([:player_one, :player_two, :player_three])
    round.next_player
    round.next_player
    round.next_player

    expect(round.played).to eq(1)

    round.next_player
    round.eliminate(:player_two)
    round.eliminate(:player_three)

    expect(round.next_player).to eq(:player_one)

    expect(round.played).to eq(3)

    round.next_player
    round.next_player
    expect(round.played).to eq(5)
  end

  it 'safasf round is consistent before elimination 2' do
    round = Round.new([:player_one, :player_two, :player_three])
    round.next_player
    round.next_player
    round.next_player

    expect(round.played).to eq(1)

    round.next_player
    round.eliminate(:player_one)

    expect(round.next_player).to eq(:player_two)
    expect(round.next_player).to eq(:player_three)

    expect(round.played).to eq(2)

    round.next_player
    round.next_player
    expect(round.played).to eq(3)
  end
end