# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths
# to all other fish lengths
def sluggish_octopus(arr)
  arr.each do |elem|
    return elem if arr.all? { |elem2| elem.length >= elem2.length }
  end
end


# Find the longest fish in O(n log n) time
def merge_sort(arr)
  return arr if arr.length < 2

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged = []
  while !left.empty? && !right.empty?
    if left.first.length >= right.first.length
      merged.push(left.shift)
    else
      merged.push(right.shift)
    end
  end
  merged += left + right
end

def dominant_octopus(arr)
  sorted = merge_sort(arr)
  sorted.first
end


# Find the longest fish in O(n) time
def clever_octopus(arr)
  longest_str = ''
  arr.each do |str|
    longest_str = str if str.length > longest_str.length
  end
  longest_str
end

