def zip(arr1, arr2)
  result_arr = []
  arr1.each_with_index { |val, ind| result_arr << [val, arr2[ind]] }
  result_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
