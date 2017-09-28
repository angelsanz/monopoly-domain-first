require 'sinatra'
require 'json'

post '/create_game' do
  empty_message = {}
  json empty_message
end

post '/take_turn' do
  message = {
    'turn' => {
      'rolls' => [1, 4],
      'steps_advanced' => 5
    }
  }
  json message
end

def json(message)
  body JSON.generate(message)
end