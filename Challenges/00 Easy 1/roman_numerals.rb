class Fixnum
  def to_roman
    number = self
    result = ''
    set = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']

    result << set[number / 1000].gsub('I', 'M')
    number %= 1000
    result << set[number / 100].gsub('I', 'C').gsub('V', 'D').gsub('X', 'M')
    number %= 100
    result << set[number / 10].gsub('X', 'C').gsub('V', 'L').gsub('I', 'X')
    number %= 10
    result << set[number]

    result
  end
end
