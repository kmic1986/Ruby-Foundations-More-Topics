class RailFenceCipher
  def self.encode(message, rails)
    return message if rails == 1
    results = Array.new(rails, '')
    rail = 0
    direction = '+'
    message.chars.each_with_index do |char, ind|
      results[rail] += char
      direction = '-' if rail == rails - 1
      direction = '+' if rail == 0
      direction == '+' ? rail += 1 : rail -= 1
    end
    results.join('')
  end

  def self.decode(message, rails)
    return message if rails == 1
    results = Array.new(rails, '')
    msg = message
    rail = 0
    direction = '+'
    message.length.times do |i|
      results[rail] += ' '
      direction = '-' if rail == rails - 1
      direction = '+' if rail == 0
      direction == '+' ? rail += 1 : rail -= 1
    end
    results.map! do |rail|
      msg.slice!(0..rail.length - 1)
    end
    rail = 0
    direction = '+'
    results.join.length.times do |i|
      msg += results[rail].slice!(0)
      direction = '-' if rail == rails - 1
      direction = '+' if rail == 0
      direction == '+' ? rail += 1 : rail -= 1
    end
    msg
  end
end

#0-2-4-6-8-10-12
#-1-3-5-7-9-11-

#0---4---8---12
#-1-3-5-7-9-11-
#--2---6---10--

#0-----6-----12
#-1---5-7---11-
#--2-4---8-10--
#---3-----9---
