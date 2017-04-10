class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      if /[aeiou]/.match(word[0]) || word[0..1] == 'yt' || word [0..1] == 'xr'
        word + 'ay'
      else
        arr = word.split('')
        while !/[aeiou]/.match(arr[0])
          arr.push(arr.shift) if arr[0] == 'q' && arr[1] == 'u'
          arr.push(arr.shift)
        end
        arr.join('') + 'ay'
      end
    end.join(' ')
  end
end
