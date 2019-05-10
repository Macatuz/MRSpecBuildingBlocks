module Enumerable
  def my_each
    for e in self
      yield e if block_given?
    end

  end

  def my_each_with_index &block
    i = 0
    for e in self
      yield(e, i) if block_given?
      i+=1
    end
  end

  def my_select
    self.my_each do  | i |
      yield i if block_given?

    end
  end

  def my_all?
    return true if !block_given?
    if self.is_a? Hash
      self.my_each { |k, v| return false if !yield k, v }
    else
      self.my_each { |el| return false if !yield el }
    end
    true
  end

  def my_any?
    return true if !block_given?
    if self.is_a? Hash
      self.my_each { |k, v| return true if yield k, v }
    else
      self.my_each { |el| return true if yield el }
    end
    false
  end


  def my_none?
    return false unless block_given?
    if self.class == Hash
      self.my_each do |k, v|
        return false if yield k, v
      end
    else
      self.my_each do |el|
        return false if yield el
      end
    end
    true
  end

  def my_count?
    return self.length unless block_given?
    count = 0
    self.my_each { |e| count += 1 if yield e }
    count
  end

  def my_map

    new_arr = Array.new
    self.my_each { |e| new_arr.push(yield e) if block_given?}
    new_arr
  end

end

arr = [12,3,4,5,65]

puts arr.my_none? { |i| i  == 12}
