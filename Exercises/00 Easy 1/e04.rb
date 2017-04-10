def divisors(num)
  results = []
  (1..num).each { |n| results << n if num % n == 0 }
  results
end

p divisors(7)
p divisors(12)
p divisors(98)
