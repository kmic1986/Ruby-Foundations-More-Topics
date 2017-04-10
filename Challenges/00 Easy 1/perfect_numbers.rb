class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    total = 0
    (1..number / 2).each do |n|
      total += n if number % n == 0
    end
    
    case
      when total > number then 'abundant'
      when total < number then 'deficient'
      when total == number then 'perfect'
    end
  end
end
