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

