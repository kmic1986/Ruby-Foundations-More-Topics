def group_1
  def check_return_with_proc
    my_proc = proc { return }
    my_proc.call
    puts "This will never output to screen."
  end

  check_return_with_proc
end

def group_2
  my_proc = proc { return }

  def check_return_with_proc_2(my_proc)
    my_proc.call
  end

  check_return_with_proc_2(my_proc)
end

def group_3
  def check_return_with_lambda
    my_lambda = lambda { return }
    my_lambda.call
    puts "This will be output to screen."
  end

  check_return_with_lambda
end

def group_4
  my_lambda = lambda { return }
  def check_return_with_lambda(my_lambda)
    my_lambda.call
    puts "This will be output to screen."
  end

  check_return_with_lambda(my_lambda)
end

def group_5
  def block_method_3
    yield
  end

  block_method_3 { return }
end

group_1
group_2
group_3
group_4
group_5
