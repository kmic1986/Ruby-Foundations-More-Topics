class Series
  def initialize(number)
    @number = number.split('').map!{|n| n.to_i}
  end

  def slices(size)
    raise ArgumentError, "Cannot give 100%!" if size > @number.length
    result = []
    # result2 = []
    sets = @number.length - size + 1
    sets.times do |n|
      result[n] = @number[n..n + size - 1]
    end
    # result.each do |set|
    #   start = set[0]
    #   set.each do |digit|
    #     start == digit ? start += 1 : start = 'X'
    #   end
    #   result2 << set unless start == 'X'
    # end
    # result2
    result
  end
end
