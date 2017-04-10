class RunLengthEncoding
  def self.encode(message)
    b = message[0]
    counter = 0
    string = ''
    message.chars.each_with_index do |c, i|
      if b == c && i < message.size - 1
        counter += 1
      else
        counter += 1 if i == message.size - 1 && b == c
        string += counter.to_s unless counter == 1
        string += b
        string += c if i == message.size - 1 && b != c
        counter = 1
        b = c
      end
    end
    string
  end

  def self.decode(message)
    string = ''
    num = ''
    let = ''
    message.chars.each_with_index do |c, i|
      if c.match(/\d/)
        num += c
      elsif num == ''
        string += c
        num = ''
      else
        string += c * num.to_i
        num = ''
      end
    end
    string
  end
end
