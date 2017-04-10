def organize_birds(arr)
  yield(arr)
end

organize_birds(%w(raven finch hawk eagle)) { |_, _,*birds_of_prey| puts birds_of_prey }
