class Queens
  attr_reader :white, :black

  def initialize(hash={:white => [0, 3], :black => [7, 3]})
    raise ArgumentError if hash[:white] == hash[:black]
    @white = hash[:white]
    @black = hash[:black]
  end

  def to_s
    results = Array.new(8, '')
    8.times do |row|
      8.times do |column|
        if @white == [row, column]
          results[row] += 'W '
        elsif @black == [row, column]
          results[row] += 'B '
        else
          results[row] += '_ '
        end
      end
      results[row] = results[row][0..-2]
    end
    results.join("\n")
  end

  def attack?
    @white[0] == @black[0] ||
    @white[1] == @black[1] ||
    ((@white[1] - @black[1]) / (@white[0] - @black[0])).abs == 1
  end
end

#  012345678
# 0--------
# 1--------
# 2--*-----
# 3--------
# 4--------
# 5-----*--
# 6--------
# 7--------
# * at [2][2]
# check [2][0..8]
#       [0..8][2]
#       [0][0], [1][1], [3][3], [4][4] ...
#       [0][4], [1][3], [3][1], [4][0]
