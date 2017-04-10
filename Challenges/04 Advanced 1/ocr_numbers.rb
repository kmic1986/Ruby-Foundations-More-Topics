class OCR
  KEY = {" _ \n| |\n|_|\n" => "0", "   \n  |\n  |\n" => "1",
         " _ \n _|\n|_ \n" => "2", " _ \n _|\n _|\n" => "3",
         "   \n|_|\n  |\n" => "4", " _ \n|_ \n _|\n" => "5",
         " _ \n|_ \n|_|\n" => "6", " _ \n  |\n  |\n" => "7",
         " _ \n|_|\n|_|\n" => "8", " _ \n|_|\n _|\n" => "9",
         "," => ","}

  def initialize(text)
    @text = text
  end

  def convert
    str = ''
    text_digits = separate(@text)
    text_digits.each do |text|
      KEY.key?(text) ? str += KEY[text] : str += "?"
    end
    str
  end

  def separate(text)
    return big_separate if text.split("\n\n").length > 1
    arr = text.split("\n")
    results = []

    arr.each_index do |i|
      arr[i] += ' ' while arr[i].length % 3 != 0 || arr[i].length < 3
    end

    (arr[0].length / 3).times do |i|
      results << arr[0][i * 3..(i * 3) + 2] + "\n" +
                 arr[1][i * 3..(i * 3) + 2] + "\n" +
                 arr[2][i * 3..(i * 3) + 2] + "\n"
    end
    results
  end

  def big_separate
    arr = []
    @text.split("\n\n").each do |line|
      arr += separate(line)
      arr += [","]
    end
    arr[0..-2]
  end
end
