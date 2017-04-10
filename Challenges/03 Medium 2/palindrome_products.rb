class Palindromes
  def initialize(args)
    @max = args[:max_factor]
    args.has_key?(:min_factor) ? @min = args[:min_factor] : @min = 1
    @palindromes = []
  end

  def generate
    (@min..@max).each do |x|
      (@min..@max).each do |y|
        if (x * y).to_s == (x * y).to_s.reverse
          pal = Palindrome.new(x * y, [x, y])
          @palindromes << pal
        end
      end
    end
    @palindromes
  end

  def largest
    l_value = 0
    @palindromes.each do |pal|
      l_value = pal.value if pal.value > l_value
    end
    l_factors = []
    @palindromes.each do |pal|
      l_factors << pal.factors if pal.value == l_value
    end
    l_factors.map! { |f| f.sort }.uniq!
    Palindrome.new(l_value, l_factors)
  end

  def smallest
    s_value = @palindromes[0].value
    @palindromes.each do |pal|
      s_value = pal.value if pal.value < s_value
    end
    s_factors = []
    @palindromes.each do |pal|
      s_factors << pal.factors if pal.value == s_value
    end
    s_factors.map! { |f| f.sort }.uniq!
    Palindrome.new(s_value, s_factors)
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
