# 97 - 122

class Cipher
  attr_reader :key

  def initialize(k=make_key)
    @key = k
    raise ArgumentError if k == ''
    k.chars.each do |e|
      if e.ord < 97 || e.ord > 122
        raise ArgumentError
      end
    end
  end

  def encode(string)
    result = ''
    string.chars.each_with_index do |c, i|
      shift_amount = @key[i].ord - 97
      if c.ord <= 122 - shift_amount
        result += (c.ord + shift_amount).chr
      else
        result += (c.ord + shift_amount - 26).chr
      end
    end
    result
  end

  def decode(string)
    result = ''
    string.chars.each_with_index do |c, i|
      shift_amount = @key[i].ord - 97
      if c.ord >= 97 + shift_amount
        result += (c.ord - shift_amount).chr
      else
        result += (c.ord - shift_amount + 26).chr
      end
    end
    result
  end

  def make_key
    r = Random.new
    string = ''
    100.times { |i| string += r.rand(97..122).chr }
    string
  end
end
