class Octal
  def initialize(number)
    n = number.split('') + ['0', '1', '2', '3', '4', '5', '6', '7']
    if n.uniq.size > 8
      @digits = [0]
    else
      @digits = number.split('').map! { |n| n.to_i }
    end
  end

  def to_decimal
    power = 0
    result = 0
    @digits.reverse.each do |d|
      result += d * (8**power)
      power += 1
    end
    result
  end
end
