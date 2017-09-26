require_relative 'directory'

class Board
  BEGINNING = 0
  SIZE = 40

  def self.beginning
    Directory.to_name(BEGINNING)
  end

  def self.travel(from, steps)
    current = Directory.to_index(from)
    location = do_move(current, steps)
    Directory.to_name(location)
  end

  def self.do_move(location, steps)
    (location + steps) % SIZE
  end
end