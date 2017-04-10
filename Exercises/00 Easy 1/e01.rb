class Tree
  include Enumerable

  def each(collection)
    number = 0
    while number <= collection.size
      yield(collection[number])
      number += 1
    end
    collection
  end
end
