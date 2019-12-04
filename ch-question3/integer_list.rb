# Given a list of integers of size N, return the largest product that can be made by multiplying any three integers.For example, if the list is [-10, -10, 5, 2], we should return 500, since that's -10 * -10 * 5. You can assume the list has at least three integers.
# 
class IntegerList
  require 'benchmark'

  def initialize(array)
    @array = array
    puts @array.to_s
  end

  def largest_trio
    # sort the list
    # take the first 2 (negative?)
    # take the last 3
    sorted = @array.sort
    final_contenders = []
    final_contenders << sorted.pop(3)
    final_contenders << sorted[0..1]
    
    big_calculator(final_contenders)
  end

  def largest_trio2
    # sort the list
    # take the first 2 (negative?)
    # take the last 3
    final_contenders = []
    final_contenders << sorted.max(3)
    final_contenders << sortex.min(2) #sorted[0..1]
    
    big_calculator(final_contenders)
  end

  def big_calculator(array)
    split3 = array.flatten.combination(3).to_a
    highest = {value: nil, items: nil}
    split3.each do |r|
      block_value = r.inject(:*)
      if highest[:value].nil? || block_value > highest[:value]
        highest[:value] = block_value 
        highest[:items] = r
      end
    end
    puts "Winner #{highest}"
  end
  # generate data
  def self.big_fake_array
    arr = []
    10000000.times do |a|
      arr << rand(-99999999999..99999999999)
    end
    arr
  end

end

i = IntegerList.new(IntegerList.big_fake_array)
# i.largest_trio
puts(Benchmark.measure {i.largest_trio})

i = IntegerList.new([-10, -10, 5, 2])
i.largest_trio
