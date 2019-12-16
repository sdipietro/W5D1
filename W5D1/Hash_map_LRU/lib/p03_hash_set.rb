class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key.hash].include?(key)
      self[key.hash] << key
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) {Array.new}
    old.flatten.each { |val| self.insert(val)}
  end
end


# class ResizingIntSet
#   attr_accessor :store, :count

#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

  # def insert(num)
  #   unless self[num].include?(num)
  #     self[num] << num 
  #     @count += 1
  #     resize! if @count > num_buckets
  #   end
  # end

  # def remove(num)
  #   if self.include?(num)
  #     self[num].delete(num) 
  #     @count -= 1
  #   end
  # end

#   def include?(num)
#     self[num].include?(num)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#     @store[num % num_buckets]
#   end

#   def num_buckets
#     @store.length
#   end

  # def resize!
  #   old = self.store
  #   self.count = 0
  #   self.store = Array.new(num_buckets * 2) {Array.new}
  #   old.flatten.each { |val| self.insert(val)}
  # end
# end
