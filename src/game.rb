require_relative 'round'
require_relative 'board'

class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  ROUNDS_IN_A_GAME = 20

  def initialize(*players)
    use(players)
    @round = Round.new(@players)
  end

  def next_turn
    current_player = @round.next_player
    initial_position = current_player.where
    current_player.move
    go_bonus(current_player, initial_position)
    current_player
  end

  def finished?
    @round.played >= ROUNDS_IN_A_GAME
  end

  private

  def go_bonus(player, initial_position)
    first = Directory.to_index(initial_position)
    last = Directory.to_index(player.where)
    player.receive_bonus if first > last
  end

  def use(players)
    check_number_of_players(players.size)
    @players = players.shuffle
  end

  def check_number_of_players(number)
    raise ArgumentError.new unless number.between?(MIN_PLAYERS, MAX_PLAYERS)
  end
end