require_relative './service'


class TakeTurn
  def self.do(context)
    game_name = context['name']
    game_state = DataService.retrieve(game_name)
    result = Service.take_turn(game_state)

    state = result['state']
    DataService.save_players(game_name, state['players'])
    DataService.save_round(game_name, state['round'])

    turn = result['turn']
    message = {
      'turn' => turn
    }
    message
  end
end