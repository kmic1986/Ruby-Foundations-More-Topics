class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    if data <= @data
      @left == nil ? @left = Bst.new(data) : @left.insert(data)
    else
      @right == nil ? @right = Bst.new(data) : @right.insert(data)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    @left.each(&block) if @left
    block.call(@data)
    @right.each(&block) if @right
  end
end
