class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    @hour < 10 ? s_hour = '0' : s_hour = ''
    @minute < 10 ? s_minute = '0' : s_minute = ''
    s_hour += @hour.to_s
    s_minute += @minute.to_s
    "#{s_hour}:#{s_minute}"
  end

  def self.at(hour, minute=0)
    clock = Clock.new(hour, minute)
    clock.normalize
    clock
  end

  def +(min)
    @minute += min
    normalize
    self
  end

  def -(min)
    @minute -= min
    normalize
    self
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def normalize
    while @minute > 59
      @hour += 1
      @minute -= 60
    end
    while @minute < 0
      @hour -= 1
      @minute += 60
    end
    @hour -= 24 if @hour > 23
    @hour += 24 if @hour < 0
  end
end
