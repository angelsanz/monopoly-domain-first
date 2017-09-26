require_relative 'round'
require_relative 'rules'

class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  ROUNDS_IN_A_GAME = 20

  def initialize(*players)
    use(players)
    @round = Round.new(@players)
    @rules = Rules::Engine.new
  end

  def next_turn
    current_player = @round.next_player
    initial_location = current_player.where
    current_player.move
    @rules.apply(current_player, initial_location)
    current_player
  end

  def finished?
    @round.played >= ROUNDS_IN_A_GAME
  end

  private

  def use(players)
    check_number_of_players(players.size)
    @players = players.shuffle
  end

  def check_number_of_players(number)
    raise ArgumentError.new unless number.between?(MIN_PLAYERS, MAX_PLAYERS)
  end
end