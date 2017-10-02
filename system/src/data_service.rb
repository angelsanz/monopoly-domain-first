require_relative './repository'


class DataService
  class << self
    def save_play_order(game_name, play_order)
      Repository.save_play_order(game_name, play_order)
    end

    def save_players(game_name, players)
      Repository.save_players(game_name, players)
    end

    def save_round(game_name, round)
      Repository.save_round(game_name, round)
    end

    def retrieve(game_name)
      Repository.retrieve(game_name)
    end
  end
end