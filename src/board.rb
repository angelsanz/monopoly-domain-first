class Board
  BEGINNING = 0
  SIZE = 40

  def self.beginning
    BEGINNING
  end

  def self.travel(from, steps)
    (from + steps) % SIZE
  end
end