require_relative 'round'
require_relative 'board'

class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  ROUNDS_IN_A_GAME = 20
  GO_TO_JAIL = 30
  JUST_VISITING = 10
  BONUS = 200

  def initialize(*players)
    use(players)
    @round = Round.new(@players)
  end

  def next_turn
    current_player = @round.next_player
    initial_location = current_player.where
    current_player.move
    go_bonus(current_player, initial_location)
    go_to_jail(current_player)
    current_player
  end

  def finished?
    @round.played >= ROUNDS_IN_A_GAME
  end

  private

  def go_bonus(player, initial_location)
    first = Directory.to_index(initial_location)
    last = Directory.to_index(player.where)
    player.receive(BONUS) if first > last
  end

  def go_to_jail(player)
    location = Directory.to_index(player.where)

    player.send_to(just_visiting) if location == GO_TO_JAIL
  end

  def use(players)
    check_number_of_players(players.size)
    @players = players.shuffle
  end

  def check_number_of_players(number)
    raise ArgumentError.new unless number.between?(MIN_PLAYERS, MAX_PLAYERS)
  end

  def just_visiting
    Directory.to_name(JUST_VISITING)
  end
end