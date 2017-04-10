def step(first, last, inc)
  count = inc
  (first..last).each do |num|
    if count == inc
      yield(num)
      count = 1
    else
      count += 1
    end
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }
