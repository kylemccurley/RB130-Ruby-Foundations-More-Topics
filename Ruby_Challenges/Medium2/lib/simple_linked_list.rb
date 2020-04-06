=begin
Write a simple linked list implementation that 
uses Elements and a List.

The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. 
Each element in the list contains data and a "next" field 
pointing to the next element in the list of elements. 
This variant of linked lists is often used to represent 
sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Lets create a singly linked list to contain the range (1..10),
and provide functions to reverse a linked list and convert to and from arrays.
=end

class Element
  attr_reader :datum, :next
  
  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !next_element
  end
  
  private
  
  attr_reader :next_element
end

class SimpleLinkedList
  attr_reader :size, :head
  
  def initialize(head = nil)
    @head = head
    @size = 0
  end
  
  def peek
    @head.datum if @head
  end
  
  def empty?
    size.zero?
  end
  
  def push(datum)
    @size += 1
    @head = Element.new(datum, @head)
  end
  
  def pop
    datum = peek
    new_head = @head.next
  
    @head = new_head
    @size -= 1
  
    datum
  end
  
  def self.from_a(array)
    new_array = array.dup
    new_array = [] if array.nil?

    list = SimpleLinkedList.new
    list.push(new_array.pop) while !new_array.empty?

    list
  end
  
  def to_a
    array = []
    array.push(pop) while !empty?
    array
  end
  
  def reverse
    new_list = SimpleLinkedList.new
    new_list.push(pop) while !empty?
    new_list
  end
end
