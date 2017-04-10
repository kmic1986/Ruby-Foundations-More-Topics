items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*others,grain|
  puts others.join(', ')
  puts grain
end

gather(items) do |fruit,*others,grain|
  puts fruit
  puts others.join(', ')
  puts grain
end

gather(items) do |fruit,*others|
  puts fruit
  puts others.join(', ')
end

gather(items) do |a, c, ca, w|
  puts "#{a}, #{c}, #{ca}, and #{w}"
end
