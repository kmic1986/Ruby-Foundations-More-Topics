def compute(param)
  block_given? ? yield(param) : "Does not compute"
end
