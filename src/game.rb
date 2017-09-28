require_relative 'round'
require_relative 'rules'
require_relative 'register'

class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  ROUNDS_IN_A_GAME = 20

  def initialize(*players)
    use(players)
    @round = Round.new(@players)
    @rules = Rules::Engine.new
    @register = Register.new
  end

  def next_turn
    current_player = get_no_loser

    raise 'We got a winner!' if @round.winner?

    initial_location = current_player.where
    current_player.move
    @rules.apply(current_player, initial_location)
    buy_property(current_player)
    pay_rent(current_player)
    current_player
  end

  def finished?
    @round.played >= ROUNDS_IN_A_GAME
  end

  private

  def buy_property(player)
    location = player.where
    return if @register.owned?(location)

    player.buy(@register.cost(location))
    @register.bought(location)
  end

  def pay_rent(player)
    location = player.where

    return unless @register.is_property?(location)
    return unless @register.owned?(location)
    return if player.owns?(location)

    rent = @register.rent(location)
    player.charge(rent)

    owner = @players.find do |player|
      player.owns?(location)
    end

    owner.receive(rent)
  end

  def get_no_loser
    current_player = @round.next_player

    if current_player.balance >= 0
      return current_player
    end

    @round.eliminate(current_player)
    get_no_loser
  end

  def use(players)
    check_number_of_players(players.size)
    @players = players.shuffle
  end

  def check_number_of_players(number)
    raise ArgumentError.new unless number.between?(MIN_PLAYERS, MAX_PLAYERS)
  end
end