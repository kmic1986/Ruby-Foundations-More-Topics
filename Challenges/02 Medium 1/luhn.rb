class Luhn
  def initialize(number)
    @number = number
    @arr = number.to_s.split('').map(&:to_i)
  end

  def addends
    results = []
    @arr.reverse.each_with_index do |e, i|
      if i % 2 == 0
        results.unshift(e)
      elsif (e * 2) <= 9
        results.unshift(e * 2)
      else
        results.unshift((e * 2) - 9)
      end
    end
    results
  end

  def checksum
    addends.inject(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    l = Luhn.new(number * 10)
    l.valid? ? number * 10 : (number * 10) + (10 - (l.checksum % 10))
  end
end
