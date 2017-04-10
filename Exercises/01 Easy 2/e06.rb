def each_with_index(arr)
  ind = 0
  arr.each do |elem|
    yield(elem, ind)
    ind += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
