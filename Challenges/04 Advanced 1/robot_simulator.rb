class Robot
  attr_reader :bearing, :coordinates

  def orient(direction)
    if [:east, :west, :north, :south].include? direction
      @bearing = direction
    else
      raise ArgumentError
    end
  end

  def turn_right
    case @bearing
    when :north then @bearing = :east
    when :south then @bearing = :west
    when :east then @bearing = :south
    when :west then @bearing = :north
    end
  end

  def turn_left
    case @bearing
    when :north then @bearing = :west
    when :south then @bearing = :east
    when :east then @bearing = :north
    when :west then @bearing = :south
    end
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case @bearing
    when :north then @coordinates[1] += 1
    when :south then @coordinates[1] -= 1
    when :east then @coordinates[0] += 1
    when :west then @coordinates[0] -= 1
    end
  end
end

class Simulator
  def place(robot, c_hash)
    robot.orient(c_hash[:direction])
    robot.at(c_hash[:x], c_hash[:y])
  end

  def instructions(string)
    string.chars.map! do |i|
      case i
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
  end

  def evaluate(robot, to_do)
    instructions(to_do).each { |inst| robot.send inst }    
  end
end
