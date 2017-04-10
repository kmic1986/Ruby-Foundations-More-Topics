def times(num)
  counter = 0
  while counter < num do
    yield(counter)
    counter += 1
  end
  num
end

times(3) do |num|
  puts num
end
