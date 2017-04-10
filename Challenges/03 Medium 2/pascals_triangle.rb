class Triangle
  def initialize(rows)
    @rows = rows
  end

  def rows
    triangle = []
    @rows.times do |row_num|
      triangle[row_num] = [1] if row_num == 0
      triangle[row_num] = [1, 1] if row_num == 1
      if row_num > 1
        last_row = triangle[row_num - 1]
        new_row = []
        (0..last_row.size - 2).each do |n|
          new_row << last_row[n] + last_row[n + 1]
        end
        triangle[row_num] = [1] + new_row + [1]
      end
    end
    triangle
  end
end
