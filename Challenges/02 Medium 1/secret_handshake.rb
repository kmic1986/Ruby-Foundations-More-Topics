class SecretHandshake
  MOVES = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse']

  def initialize(number)
    @number = number
  end

  def commands
    @number.is_a?(Integer) ? number = @number.to_s(2) : number = @number
    results = []
    return results if number.to_i(2) <= 0 || number.to_i(2) > 31

    number.split('').reverse.each_with_index do |bit, ind|
      results.push(MOVES[ind]) if bit == '1'
    end

    if results.last == 'reverse'
      results.pop
      results.reverse!
    end
    results
  end
end
