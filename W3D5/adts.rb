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

