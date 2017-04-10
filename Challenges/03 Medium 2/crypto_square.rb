class Crypto
  def initialize(raw_text)
    @raw_text = raw_text
  end

  def normalize_plaintext
    @raw_text.gsub(/[^0-9a-zA-Z]/, '').downcase
  end

  def size
    length = normalize_plaintext.size
    while Math.sqrt(length) % 1 != 0
      length += 1
    end
    Math.sqrt(length).to_i
  end

  def plaintext_segments
    results = []
    normalize_plaintext.chars.each_slice(size) { |set| results << set.join('') }
    results
  end

  def ciphertext
    result = ''
    size.times do |i|
      plaintext_segments.each do |segment|
        result += segment[i] if segment[i] != nil
      end
    end
    result
  end

  def normalize_ciphertext
    result = Array.new(size, '')
    size.times do |i|
      plaintext_segments.each do |segment|
        result[i] += segment[i] if segment[i] != nil
      end
    end
    result.join(' ')
  end
end
