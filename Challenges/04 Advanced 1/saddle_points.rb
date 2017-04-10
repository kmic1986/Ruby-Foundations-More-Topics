class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def rows
    results = []
    row = []
    number = ''
    @matrix_string.chars.each_with_index do |char, ind|
      number += char if char.match(/\d/)
      if char == ' '
        row << number.to_i
        number = ''
      elsif char == "\n" || ind == @matrix_string.length - 1
        row << number.to_i
        results << row
        row = []
        number = ''
      end
    end
    results
  end

  def columns
    results = []
    input = rows
    input[0].length.times do |i|
      column = []
      input.each do |row|
        column << row[i]
      end
      results << column
    end
    results
  end

  def saddle_points
    grid = rows
    results = []
    grid.each_with_index do |row, row_num|
      row.each_with_index do |elem, col_num|
        unless ((row_num > 0 &&
                 grid[row_num - 1][col_num] < elem) ||
                (row_num < grid.length - 1 &&
                 grid[row_num + 1][col_num] < elem) ||
                (col_num > 0 &&
                 grid[row_num][col_num - 1] > elem) ||
                (col_num < row.length - 1 &&
                 grid[row_num][col_num + 1] > elem)) ||
               ((row_num == 0 || row_num == grid.length - 1) &&
                (col_num == 0 || col_num == row.length - 1) &&
                (grid.length > 2 && row.length > 2))
          results << [row_num, col_num]
        end
      end
    end
    results
  end
end
