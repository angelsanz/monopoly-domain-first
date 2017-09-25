class Round
  def initialize(players)
    @players = players
    @played = 0
    @index = 0
  end

  def played
    @played
  end

  def next_player
    result = @players[@index]
    @index += 1
   
    if finished?
      next_round
    end

    result
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