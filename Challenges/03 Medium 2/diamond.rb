# 65 - 90
class Diamond
  def self.make_diamond(letter)
    rows = (2 * (letter.ord - 65)) + 1
    row = 1
    string = ''
    (1..rows).each { |row| string += row_string(row, rows) }
    string
  end

  def self.row_string(row, rows)
    string = ''
    row = (rows - row) + 1 if row > (rows + 1) / 2
    letter = (row + 64).chr
    if row == 1 || row == rows
      space = ' ' * ((rows - 1) / 2)
      space + letter + space + "\n"
    elsif row <= (rows + 1) / 2
      i_space = ' ' * (2 * row - 3)
      o_space = ' ' * ((rows - (2 * row - 1)) / 2)
      o_space + letter + i_space + letter + o_space + "\n"
    end
  end
end
