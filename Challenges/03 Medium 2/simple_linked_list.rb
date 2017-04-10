class SimpleLinkedList
  def initialize
    @list = []
  end

  def reverse
    s = SimpleLinkedList.new
    s.push(pop) while !empty?
    s
  end

  def to_a
    @list.map { |e| e.datum }
  end

  def self.from_a(arr)
    s = SimpleLinkedList.new
    arr.to_a.reverse.each { |d| s.push d }
    s
  end

  def push(d)
    @list.unshift Element.new(d, head)
  end

  def pop
    @list.shift.datum
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    empty? ? nil : head.datum
  end

  def head
    @list[0]
  end
end

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_e=nil)
    @datum = datum
    @next = next_e
  end

  def tail?
    @next == nil
  end
end
