class SumOfMultiples
  def initialize(a=3, b=5, c='X')
    @a = a
    @b = b
    @c = c
  end

  def self.to(limit)
    sum = 0
    limit.times do |n|
      sum += n if n % 3 == 0 || n % 5 == 0
    end
    sum
  end

  def to(limit)
    sum = 0
    limit.times do |n|
      if n % @a == 0
        sum += n
      elsif n % @b == 0
        sum += n
      elsif @c != 'X' && n % @c == 0
        sum += n
      end
    end
    sum
  end
end
