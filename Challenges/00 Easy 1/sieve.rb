class Sieve
  def initialize(last_number)
    @set = Array.new(last_number - 1) { |i| i + 2 }
  end

  def primes
    result = @set
    result.each_with_index do |n, i|
      next if n == 'X'
      ((result.size - n + 1) / n).times do |x|
        result[i + (n * (x + 1))] = 'X'
      end
    end
    result.delete('X')
    result
  end
end

s = Sieve.new(25)
s.primes
