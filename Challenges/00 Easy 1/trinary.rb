class Trinary
  def initialize(number)
    n = number.split('') + ['0', '1', '2']
    if n.uniq.size > 3
      @digits = [0]
    else
      @digits = number.split('').map! { |n| n.to_i }
    end
  end

  def to_decimal
    power = 0
    result = 0
    @digits.reverse.each do |d|
      result += d * (3**power)
      power += 1
    end
    result
  end
end
