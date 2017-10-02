require 'monopoly'


module Domain
  class Player < ::Player
    def initialize(name)
      super()
      @steps_advanced = 0
      @name = name
    end

    def steps_advanced
      @steps_advanced
    end

    def advance(steps)
      @steps_advanced = steps
      super
    end

    def latest_rolls
      @latest_rolls
    end

    def roll
      a_roll = @dice.roll
      another_roll = @dice.roll
      @latest_rolls = [a_roll, another_roll]
      a_roll + another_roll
    end

    def name
      @name
    end
  end

  class Game < ::Game
    def play_order
      @players.map(&:name)
    end

    def played_rounds
      @round.played
    end

    def players
      @players
    end

    def set_players(players)
      @round = Domain::Round.new(players)
      @players = players
    end

    def set_player_who_just_played(player_name)
      @round.set_player_who_just_played(player_name)
    end

    class Builder
      def initialize
        @game = a_valid_game
      end

      def with_players_in_order(players_spec)
        @game.set_players(build_players(players_spec))
        self
      end

      def just_played_by(player_name)
        @game.set_player_who_just_played(player_name)
        self
      end

      def build
        @game
      end

      private

      def a_valid_game
        Domain::Game.new(::Player.new, ::Player.new)
      end

      def build_players(players_spec)
        players_spec.map { |spec|
          player = Domain::Player.new(spec['name'])
          player.send_to(spec['location'])
          player
        }
      end
    end
  end

  class Round < ::Round
    def set_player_who_just_played(player_name)
      @index_of_next_player = (index_of(player_name) + 1) % @players.size
    end

    def index_of(player_name)
      @players.map(&:name).find_index(player_name)
    end
  end
end
