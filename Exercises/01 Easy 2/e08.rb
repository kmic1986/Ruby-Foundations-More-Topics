def max_by(arr)
  result_arr = []
  arr.each { |elem| result_arr << yield(elem) }
  (arr.length - 1).times do |n|
    if result_arr[0] < result_arr[1]
      result_arr.delete_at(0)
      arr.delete_at(0)
    else
      result_arr.delete_at(1)
      arr.delete_at(1)
    end
  end
  arr[0]
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil
