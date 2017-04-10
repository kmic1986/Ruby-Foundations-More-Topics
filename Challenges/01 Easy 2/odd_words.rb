class Sentence
  def initialize(sentence)
    @sentence = sentence
  end

  def mixup
    len = @sentence.split(' ').size - 2
    @sentence.split(' ').each_with_index do |word, index|
      if index % 2 == 0 || word == '.'
        print word
        print ' ' unless index >= len
      else
        print word.split('').reverse.join('')
        print ' ' unless index >= len
      end
    end
  end
end

#print var

sentence = Sentence.new(" hello   there all    .")
sentence.mixup
