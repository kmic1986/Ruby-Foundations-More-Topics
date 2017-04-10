class Triplet
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(hash)
    max_factor = hash[:max_factor]
    hash.key?(:min_factor) ? min_factor = hash[:min_factor] : min_factor = 1
    hash.key?(:sum) ? sum = hash[:sum] : sum = 'x'
    arr = []
    t = Triplet.new(1, 1, max_factor)

    (min_factor..max_factor).each do |first|
      t.a = first
      (t.a..max_factor).each do |second|
        t.b = second
        (t.b..max_factor).each do |third|
          t.c = third
          if sum == 'x'
            arr << Triplet.new(t.a, t.b, t.c) if t.pythagorean?
          else
            arr << Triplet.new(t.a, t.b, t.c) if t.pythagorean? && t.sum == sum
          end
        end
      end
    end

    arr
  end
end
