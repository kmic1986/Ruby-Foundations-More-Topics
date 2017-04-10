class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      @todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[@todos.size - 1]
  end

  def item_at(ind)
    if ind < 0 || ind >= @todos.size
      raise IndexError
    else
      @todos[ind]
    end
  end

  def mark_done_at(ind)
    if ind < 0 || ind >= @todos.size
      raise IndexError
    else
      @todos[ind].done!
    end
  end

  def mark_undone_at(ind)
    if ind < 0 || ind >= @todos.size
      raise IndexError
    else
      @todos[ind].undone!
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(ind)
    if ind < 0 || ind >= @todos.size
      raise IndexError
    else
      @todos.delete_at(ind)
    end
  end

  def to_s
    puts "---- #{@title} ----"
    puts @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
#puts list.size                       # returns 3

# first
#puts list.first                      # returns todo1, which is the first item in the list

# last
#puts list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
#puts list.item_at                    # raises ArgumentError
#puts list.item_at(1)                 # returns 2nd item in list (zero based index)
#puts list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
#list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

#puts list.item_at(1)

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
#list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

#puts list.item_at(1)

# ---- Deleting from the the list -----

# shift
#puts list.shift                      # removes and returns the first item in list

# pop
#puts list.pop                        # removes and returns the last item in list

# remove_at
#list.remove_at                  # raises ArgumentError
#puts list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
#list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

#list.each do |todo|
#  puts todo                   # calls Todo#to_s
#end

#todo1.done!

#results = list.select { |todo| todo.done? }    # you need to implement this method

#puts results.inspect

#puts list.find_by_title("Buy milk")
#p list.find_by_title("Go home")

#list.mark_done_at(0)
#puts list.all_done
#puts list.all_not_done

#list.mark_done("Buy milk")
#puts list

#list.mark_all_done
#puts list
#list.mark_all_undone
#puts list
