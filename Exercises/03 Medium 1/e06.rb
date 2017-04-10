def group_1
  my_proc = proc { |thing| puts "This is a #{thing}." }
  puts my_proc
  puts my_proc.class
  my_proc.call
  my_proc.call('cat')
end

def group_2
  my_lambda = lambda { |thing| puts "This is a #{thing}" }
  my_second_lambda = -> (thing) { puts "This is a #{thing}" }
  puts my_lambda
  puts my_second_lambda
  puts my_lambda.class
  my_lambda.call('dog')
  my_lambda.call
  my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
end

def group_3
  def block_method_1(animal)
    yield
  end

  block_method_1('seal') { |seal| puts "This is a #{seal}."}
  block_method_1('seal')
end

def group_4
  def block_method_2(animal)
    yield(animal)
  end

  block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
  block_method_2('turtle') do |turtle, seal|
    puts "This is a #{turtle} and a #{seal}."
  end
  block_method_2('turtle') { puts "This is a #{animal}."}
end

#group_1
#group_2
#group_3
#group_4
