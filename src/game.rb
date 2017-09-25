class Game
  MIN = 2
  MAX = 8

  def initialize(*players)
    check_number_of_players!(players.size)
    @players = players.shuffle
  end

  def is_playing?(player)
    @players.include?(player)
  end

  def whose_turn
    @players.first
  end

  private

  def check_number_of_players!(number)
    raise ArgumentError.new unless number.between?(MIN, MAX)
  end
end