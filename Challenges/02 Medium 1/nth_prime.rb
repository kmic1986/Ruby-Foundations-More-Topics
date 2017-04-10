class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    results = [2]
    number = 3
    while results.size < num
      prime = true
      results.each do |p|
        break if p > Math.sqrt(number)
        prime = false if number % p == 0
      end
      results << number if prime == true
      number += 2
    end
    results.last
  end
end
