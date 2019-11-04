class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n) where n is the number of elements the heap has
  # Space Complexity: O(log n)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) where n is the number of elements the heap has
  # Space Complexity: O(log n)
  def remove()
    swap(0, @store.length - 1)
    removed = @store.pop.value
    heap_down(0)
    return removed
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(n) where n is the number of elements in the heap
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) where n is the number of elements the heap has
  # Space complexity: O(log n)
  def heap_up(index)
    parent_index = 0

    if index % 2 == 0
      parent_index = (index - 2)/ 2
    else
      parent_index = (index - 1)/ 2
    end

    if index != 0 && @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    smaller_child = left_child

    return if @store[left_child].nil?

    if @store[right_child] && @store[left_child].key >= @store[right_child].key
        smaller_child = right_child
    end
    
    if @store[index].key > @store[smaller_child].key
      swap(index, smaller_child)
      return heap_down(smaller_child)
    else
      return
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end