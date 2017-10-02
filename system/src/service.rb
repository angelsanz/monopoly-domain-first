require_relative './domain'


class Service
  def self.create_game(game_name)
    a_player = Domain::Player.new('horse')
    another_player = Domain::Player.new('car')
    game = Domain::Game.new(a_player, another_player)

    players = game.players
    a_player = players[0]
    another_player = players[1]
    result = {
      'name' => game_name,
      'state' => {
        'play_order' => game.play_order,
        'players' => {
          a_player.name => {
            'name' => a_player.name,
            'location' => a_player.where,
          },
          another_player.name => {
            'name' => another_player.name,
            'location' => another_player.where,
          }
        }
      }
    }
    result
  end

  def self.take_turn(game_state)
    players = game_state['play_order'].map { |name| game_state['players'][name] }

    is_not_first_turn = game_state.key?('round')
    game = if is_not_first_turn
      Domain::Game::Builder.new.with_players_in_order(players)
        .just_played_by(game_state['round']['current_player'])
        .build
    else
      Domain::Game::Builder.new.with_players_in_order(players)
        .build
    end

    player_who_just_played = game.next_turn
    players = game.players
    a_player = players[0]
    another_player = players[1]
    result = {
      'turn' => {
        'rolls' => player_who_just_played.latest_rolls,
        'steps_advanced' => player_who_just_played.steps_advanced,
        'landing_location' => Directory.to_index(player_who_just_played.where),
      },
      'state' => {
        'players' => {
          a_player.name => {
            'name' => a_player.name,
            'location' => a_player.where,
          },
          another_player.name => {
            'name' => another_player.name,
            'location' => another_player.where,
          },
        },
        'round' => {
          'current_player' => player_who_just_played.name,
          'played_rounds' => game.played_rounds,
        }
      }
    }
    result
  end
end