require 'httparty'


describe 'player' do
  it 'advances the sum of rolling two dice' do
    post '/create_game', {name: a_game}

    response = post '/take_turn', {game: a_game}

    turn = response['turn']
    rolls = turn['rolls']
    steps_advanced = turn['steps_advanced']
    expect(rolls.size).to eq 2
    expect(steps_advanced).to eq rolls[0] + rolls[1]
  end

  it 'location increments by the number of steps advanced' do
    post '/create_game', {name: a_game}
    initial_location = 0

    response = post '/take_turn', {game: a_game}

    turn = response['turn']
    location = turn['landing_location']
    steps_advanced = turn['steps_advanced']
    expect(location).to eq initial_location + steps_advanced

    intermediate_location = initial_location + steps_advanced

    post '/take_turn', {game: a_game}

    response = post '/take_turn', {game: a_game}
    turn = response['turn']
    location = turn['landing_location']
    steps_advanced = turn['steps_advanced']
    expect(location).to eq intermediate_location + steps_advanced
  end

  def post(endpoint, message)
      HTTParty.post("http://localhost:4567#{endpoint}", body: JSON.generate(message), format: :json).parsed_response
  end

  def a_game
    'a_game'
  end
end