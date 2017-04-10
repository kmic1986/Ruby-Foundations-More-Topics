def select(arr)
  counter = 0
  ret = []
  while counter < arr.length
    ret << arr[counter] if yield(arr[counter])
    counter += 1
  end
  ret
end

array = [1, 2, 3, 4, 5]
p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
