def each(arr)
  counter = 0
  while counter < arr.length
    yield arr[counter]
    counter += 1
  end
  arr  
end

each([1, 2, 3]) do |item|
  puts item
end
