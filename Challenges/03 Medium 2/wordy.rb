class WordProblem
  OPS = ["+", "-", "*", "/"]

  def initialize(problem)
    @problem = problem
  end

  def answer
    arr = @problem.gsub("What is ", "")
                  .gsub("?", "")
                  .gsub("plus", "+")
                  .gsub("minus", "-")
                  .gsub("multiplied by", "*")
                  .gsub("divided by", "/").split(' ')
    while arr.size > 1
      raise ArgumentError unless OPS.include?(arr[1])
      ans = arr[0].to_i.send(arr[1], arr[2].to_i)
      arr = [ans] + arr[3..-1]
    end
    arr[0]
  end
end
