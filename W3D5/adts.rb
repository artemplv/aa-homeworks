# Exercise 1: Stack
class Stack
  def initialize
    @elements = []
  end

  def push(el)
    @elements.push(el)
  end

  def pop
    @elements.pop
  end

  def peek
    @elements.last
  end
end

# Exercise 2: Queue
class Queue
  def initialize
    @elements = []
  end

  def enqueue(el)
    @elements.push(el)
  end

  def dequeue
    @elements.shift
  end

  def peek
    @elements.first
  end
end

# Excercise 3: Map
class Map
  def initialize
    @elements = []
  end

  def key_index(key)
    @elements.index { |el| el.first == key }
  end

  def set(key, value)
    existing_key_index = key_index(key)
    
    if existing_key_index
      @elements[existing_key_index][1] = value
    else
      @elements.push([key, value])
    end
  end

  def get(key)
    el = @elements.find { |el| el.first == key }
    return el ? el[1] : nil
  end

  def delete(key)
    index_to_delete = key_index(key)
    @elements.delete_at(index_to_delete)
  end
end
