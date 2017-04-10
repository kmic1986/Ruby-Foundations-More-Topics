class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    results = {}
    @string.gsub(',', ' ').delete("!&@$%^&.:").downcase.split(' ').each do |word|
      word = word[1..-2] if word.start_with?("'") && word.end_with?("'")
      results.has_key?(word) ? results[word] += 1 : results[word] = 1
    end
    results
  end
end
