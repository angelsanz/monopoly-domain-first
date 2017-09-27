class Round
  def initialize(players)
    @players = players
    @played = 0
    @index = 0
  end

  def played
    @played
  end

  def eliminate(player)
    eliminated_index = @players.find_index(player)

    @players.delete(player)

    @index -= 1 if eliminated_index < @index

    next_round if finished?
  end

  def next_player
    result = @players[@index]
    @index += 1
   
    next_round if finished?

    result
  end

  def winner?
    @players.size == 1
  end

  private

  def finished?
    @index >= @players.size
  end

  def next_round
    @played += 1
    @index = 0
  end
end