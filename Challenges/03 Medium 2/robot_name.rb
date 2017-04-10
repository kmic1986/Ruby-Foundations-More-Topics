class Robot
  def initialize
    @name = "#{rcl}#{rcl}#{rd}#{rd}#{rd}"
  end

  def rcl
    r = Random.new
    r.rand(65..90).chr
  end

  def rd
    r = Random.new
    r.rand(10).to_s
  end

  def name
    @name
  end

  def reset
    initialize
  end
end
