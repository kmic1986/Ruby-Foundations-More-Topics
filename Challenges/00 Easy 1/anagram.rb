class Anagram
  def initialize(word)
    @word = word
  end

  def match(set)
    matches = []
    set.each do |other_word|
      if @word.downcase.split('').sort == other_word.downcase.split('').sort &&
         @word.downcase.split('') != other_word.downcase.split('')
        matches << other_word
      end
    end
    matches
  end
end
