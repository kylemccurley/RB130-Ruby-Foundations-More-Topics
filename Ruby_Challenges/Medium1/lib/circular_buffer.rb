=begin
  Data Structure for The Buffer:
    - Array:
      > How to represent an empty space
        for the array?
          > nil

  What Raises a BufferEmptyException?
    - Trying to read an element from the
    buffer when the buffer is empty.


  write method:
  Expected Behavior for the Write Method:
    Need to find oldest value (that isn't nil), remove that value from the buffer,
    then return that value.
=end

class CircularBuffer
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def clear
    @buffer.map! { |_| nil }
  end

  # Read/Write Functionality
  def read
    raise BufferEmptyException if buffer_empty?

    @buffer.append(nil)
    @buffer.shift
  end

  def write(data)
    raise BufferFullException if buffer_full?

    write_index = first_empty_slot
    @buffer[write_index] = data unless data.nil?
  end

  def write!(data)
    return if data.nil?

    if buffer_full?
      @buffer.shift
      @buffer.append(data)
    else
      write(data)
    end
  end

  private

  def buffer_full?
    @buffer.none? do |slot|
      slot.nil?
    end
  end

  def buffer_empty?
    @buffer.all?(&:nil?)
  end

  def first_empty_slot
    @buffer.each_with_index do |slot, idx|
      return idx if slot.nil?
    end
  end

  def oldest_element_index
    0.upto(@buffer.size) do |idx|
      element = @buffer[idx]
      return idx unless element.nil?
    end
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
