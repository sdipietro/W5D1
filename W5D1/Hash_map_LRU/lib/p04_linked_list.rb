class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    next.prev = prev
    prev.next = next 
    next = nil
    prev = nil
  end

end

class LinkedList

  include Enumerable

  attr_reader :tail, :head

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    head.next == tail
  end

  def get(key)
    self.each do |current_node|
      return current_node.val if current_node.key == key
    end
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)

    tail.prev.next = new_node
    new_node.prev = tail.prev
    new_node.next  = tail
    tail.prev = new_node
  end

  def update(key, val)
    self.each do |current_node|
      if current_node.key == key
        current_node.val = val
      end
    end
  end

  def remove(key)
    # self.each do |current_node|
    #   if current_node.key == key
    #     current_node.remove
    #   end
    # end
  end

  def each
    sample_node = head.next
    until sample_node == tail
      yield sample_node
      sample_node = sample_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
