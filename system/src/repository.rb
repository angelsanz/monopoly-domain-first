class Repository
  @@storage = Hash.new do |storage, game_name|
    storage[game_name] = {}
  end

  class << self
    def save_play_order(game_name, play_order)
      @@storage[game_name]['play_order'] = play_order
    end

    def save_players(game_name, players)
      @@storage[game_name]['players'] = players
    end

    def save_round(game_name, round)
      @@storage[game_name]['round'] = round
    end

    def retrieve(game_name)
      @@storage[game_name]
    end
  end
end