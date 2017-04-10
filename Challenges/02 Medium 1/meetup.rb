class Meetup
  DAYS = [:_, :monday, :tuesday, :wednesday, :thursday,
          :friday, :saturday, :sunday]
  SPANS = {:teenth => (13..19), :first => (1..7), :second => (8..14),
           :third => (15..21), :fourth => (22..28), :last => (-7..-1)}

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, place)
    date = 0
    span = SPANS[place]

    span.each do |d|
      date = d if Date.new(@year, @month, d).cwday == DAYS.index(day_of_week)
    end
    
    Date.new(@year, @month, date)
  end
end
