require_relative 'round'

class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  ROUNDS_IN_A_GAME = 20

  def initialize(*players)
    use(players)
    @round = Round.new(@players)
  end

  def next_turn
    @round.next_player
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