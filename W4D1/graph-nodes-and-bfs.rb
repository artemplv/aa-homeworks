require "set"

class GraphNode
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end
end

def bfs(starting_node, target_value)
  visited = Set.new

  queue = [starting_node]
  
  while !queue.empty?
    node = queue.shift
    return nil if visited.include?(node.value)

    visited.add(node.value)
    
    return node if node.value == target_value
    
    node.neighbors.each { |neighbor| queue.push(neighbor) }
  end
  nil
end



a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")