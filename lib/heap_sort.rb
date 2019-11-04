require_relative "./min_heap.rb"

# This method uses a heap to sort an array.
# Time Complexity: O(log n) where n is the number of elements the heap has
# Space Complexity: O(n)
def heap_sort(list)
  sorted_list = []

  if list.length < 2
    return list
  else
    heap = MinHeap.new()

    list.each do |element|
      heap.add(element)
    end

    until heap.empty?
      sorted_list << heap.remove()
    end
    return sorted_list
  end
end