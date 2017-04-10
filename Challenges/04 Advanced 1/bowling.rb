class Game
  def initialize
    @frame = []
    @game = []
  end

  def roll(pins)
    if game_over?
      raise RuntimeError, 'Should not be able to roll after game is over'
    end
    if pins < 0 || pins > 10
      raise RuntimeError, 'Pins must have a value from 0 to 10'
    end
    @frame << pins
    if @frame.inject(:+) > 10
      raise RuntimeError, 'Pin count exceeds pins on the lane'
    end
    if (@frame.inject(:+) == 10 || @frame.length == 2) ||
       (@game.length == 10 && spare?(@game[9]))
      @game << @frame
      @frame = []
    end
  end

  def score
    unless game_over?
      raise RuntimeError, 'Score cannot be taken until the end of the game'
    end
    total = 0
    @game.each_with_index do |frame, f_num|
      next if f_num >= 10
      if open?(frame)
        total += frame.reduce(:+)
      end
      if spare?(frame)
        total += 10 + @game[f_num + 1..-1].flatten.first
      end
      if strike?(frame)
        total += 10 + @game[f_num + 1..-1].flatten.first(2).reduce(:+)
      end
    end
    total
  end

  def open?(frame)
    frame.reduce(:+) < 10
  end

  def spare?(frame)
    frame.reduce(:+) == 10 && frame.length == 2
  end

  def strike?(frame)
    frame.reduce(:+) == 10 && frame.length == 1
  end

  def game_over?
    (@game.length == 10 && open?(@game[8]) && open?(@game[9])) ||
    (@game.length == 11 && !strike?(@game[10])) ||
    (@game.length == 12)
  end
end
