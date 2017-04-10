def missing(arr)
  result = []
  (arr[0]..arr[arr.size - 1]).each do |num|
    result << num if !arr.include? num
  end
  result
end
