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
    str = "---- #{@title} ----"
    str += "\n"
    each do |todo|
      str += todo.to_s
      str += "\n"
    end
    str.chomp
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

  def done!
    each { |todo| todo.done! }
  end

  def done?
    marker = true
    each { |todo| marker = false if !todo.done? }
    marker
  end

  def to_a
    result = []
    each { |todo| result << todo }
    result
  end

  def <<(todo)
    @todos.push(todo)
  end
end
