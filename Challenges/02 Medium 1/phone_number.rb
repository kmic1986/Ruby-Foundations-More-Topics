class PhoneNumber
  def initialize(number)
    @raw_number = number
    @clean_number = clean(@raw_number)
  end

  def clean(num)
    results = num.gsub(/\D/, '')
    if (num.match(/[a-zA-Z]/)) ||
       (results.size > 11) ||
       (results.size < 10) ||
       (results.size == 11 && results[0] != '1')
       results = '0000000000'
    end
    results = num[1..-1] if num.size == 11 && num[0] == '1'
    results
  end

  def number
    @clean_number
  end

  def to_s
    num = number
    "(#{num[0..2]}) #{num[3..5]}-#{num[6..9]}"
  end

  def area_code
    number[0..2]
  end
end
