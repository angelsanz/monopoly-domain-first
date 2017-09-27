class Round
  def initialize(players)
    @players = players
    @index_of_next_player = 0
    @played = 0
  end

  def played
    @played
  end

  def eliminate(player)
    eliminated_index = @players.find_index(player)

    @players.delete(player)

    @index_of_next_player -= 1 if eliminated_index < @index_of_next_player

    next_round if finished?
  end

  def next_player
    result = @players[@index_of_next_player]
    @index_of_next_player += 1

    next_round if finished?

    result
  end

  def winner?
    @players.size == 1
  end

  private

  def finished?
    @index_of_next_player >= @players.size
  end

  def next_round
    @played += 1
    @index_of_next_player = 0
  end
end