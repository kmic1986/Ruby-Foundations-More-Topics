class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    raise BufferEmptyException if @buffer == []
    @buffer.shift
  end

  def write(e)
    raise BufferFullException if @buffer.size == @size
    @buffer.push e unless e == nil
  end

  def clear
    @buffer = []
  end

  def write!(e)
    unless e == nil
      @buffer.shift if @buffer.size == @size
      @buffer.push e
    end
  end
end
