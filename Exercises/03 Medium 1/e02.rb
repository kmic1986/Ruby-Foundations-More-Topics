class TextAnalyzer
  def process
    file = File.open('sample_txt.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} sentences" }
analyzer.process { |file| puts "#{file.split(" ").count} words" }
