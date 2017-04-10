class School
  def initialize
    @book = Hash.new([])
  end

  def to_h
    @book
  end

  def add(name, grade)
    if @book.keys.include? grade
      @book[grade] += [name]
    else
      @book[grade] = [name]
      temp = {}
      @book.keys.sort.each { |k| temp[k] = @book[k].sort }
      @book = temp
    end
  end

  def grade(number)
    @book[number]
  end
end
