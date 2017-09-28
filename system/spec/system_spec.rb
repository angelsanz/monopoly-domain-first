require 'httparty'


describe 'player' do
  it 'moves the sum of rolling two dice' do
    a_game = 'a_game'
    post '/create_game', {name: a_game}

    response = post '/take_turn', {game: a_game}

    turn = response['turn']
    rolls = turn['rolls']
    steps_advanced = turn['steps_advanced']
    expect(rolls.size).to eq 2
    expect(steps_advanced).to eq rolls[0] + rolls[1]
  end

  def post(endpoint, message)
      HTTParty.post("http://localhost:4567#{endpoint}", body: JSON.generate(message), format: :json).parsed_response
  end
end