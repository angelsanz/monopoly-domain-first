class Game
  MIN_PLAYERS = 2
  MAX_PLAYERS = 8
  FIRST_ROUND = 1
  FIRST_TURN = 0
  ROUNDS_IN_A_GAME = 20

  def initialize(*players)
    check_number_of_players!(players.size)
    @players = players.shuffle
    @round = FIRST_ROUND
    @turn = FIRST_TURN
  end

  def is_playing?(player)
    @players.include?(player)
  end

  def next_turn
    result = @players[@turn]
    @turn += 1

    if @turn >= @players.size
      @round += 1
      @turn = FIRST_TURN
    end

    result
  end

  def finished?
    @round > ROUNDS_IN_A_GAME
  end

  private

  def check_number_of_players!(number)
    raise ArgumentError.new unless number.between?(MIN_PLAYERS, MAX_PLAYERS)
  end
end