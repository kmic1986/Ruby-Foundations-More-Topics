class Garden
  VEG = {'R' => :radishes, 'C' => :clover,
         'G' => :grass, 'V' => :violets}

  DEFAULT_STUDENTS = ['alice', 'bob', 'charlie', 'david',
                      'eve', 'fred', 'ginny', 'harriet',
                      'ileana', 'joseph', 'kincaid', 'larry']

  def initialize(rows, students=DEFAULT_STUDENTS)
    @rows = rows.split("\n")
    @students = students.map { |n| n.downcase }.sort
  end

  def method_missing(name)
    num = @students.index(name.to_s)
    range = (num * 2..(num * 2) + 1)
    (@rows[0][range] + @rows[1][range]).split('').map { |v| VEG[v] }
  end
end
