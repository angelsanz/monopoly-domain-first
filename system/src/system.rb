require 'sinatra'
require 'json'

require_relative './create_game'
require_relative './take_turn'


post '/create_game' do
  context = {'name': request_body['name']}
  message = CreateGame.do(context)
  json message
end

post '/take_turn' do
  context = {'game_name': request_body['name']}
  message = TakeTurn.do(context)
  json message
end

def json(message)
  body JSON.generate(message)
end

def request_body
  JSON.parse request.body.read
end