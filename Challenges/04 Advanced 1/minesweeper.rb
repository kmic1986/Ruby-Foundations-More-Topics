class ValueError < StandardError
end

class Board
  def self.transform(input)
    board = input
    rows = board.length - 2
    columns = board[0].length - 2

    board.each_with_index do |row, row_number|
      raise ValueError unless row.length - 2 == columns
      raise ValueError unless row[0] == row[-1] &&
                              ['+', '|'].include?(row[0])
      row.chars.each_with_index do |element, column_number|
        raise ValueError unless ['+', '-', ' ', '*', '|'].include?(element)
        count = 0
        if element == ' '
          count += 1 if board[row_number - 1][column_number - 1] == '*'
          count += 1 if board[row_number - 1][column_number] == '*'
          count += 1 if board[row_number - 1][column_number + 1] == '*'
          count += 1 if board[row_number][column_number - 1] == '*'
          count += 1 if board[row_number][column_number + 1] == '*'
          count += 1 if board[row_number + 1][column_number - 1] == '*'
          count += 1 if board[row_number + 1][column_number] == '*'
          count += 1 if board[row_number + 1][column_number + 1] == '*'
        end
        board[row_number][column_number] = count.to_s if count > 0
      end
    end

    board

  end
end

#  012345
# 0------
# 1------
# 2--*---
# 3------
# 4------
# 5------
# * at [2][2]
# check [1][1], [1][2], [1][3],
#       [2][1],         [2][3],
#       [3][1], [3][2], [3][3]
