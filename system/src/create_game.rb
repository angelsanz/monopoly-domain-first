require_relative './service'
require_relative './data_service'


class CreateGame
  def self.do(context)
    name = context['name']
    result = Service.create_game(name)

    game_name = result['name']
    game_state = result['state']
    DataService.save_play_order(game_name, game_state['play_order'])
    DataService.save_players(game_name, game_state['players'])

    empty_message = {}
    empty_message
  end
end