# Given a list of numbers and a number k, return whether any two numbers from the list add up to k. For example, given [10, 15, 3, 7, -1, 5,-13,45,...] and k of 17, return the two numbers since 10 + 7 is 17.

class AddMeUp
  
require "benchmark"
# require "file"
# puts(Benchmark.measure { sleep 0.5 })

  # initialize and accept an array of values and a key
  def initialize(val)
    file = File.read('testarray')
    @array = load_array(file)
    @value = val.to_i
  end

  def load_array(csv)
    arr = csv.split(',')
    arr = arr.map{|r| r.to_i}
    arr
  end

  def basic
    @array.each do |a| # Loop over the array
      search_val = @value - a # calculate what the correct other value would be
      find_val = @array.index(search_val) # perform a find_first on the whole array looking for the other value
      return "#{a} + #{search_val}" unless find_val.nil? # if we find a match return that value, if we don't move onto the next one
    end
  end

  def cheat_result
    seen = {} # create an empty hash of searched results
    @array.each do |i| # loop over the array
      return "#{@value-i} + #{i}" if seen[@value-i] # if we find a match in our search results return the values, if not continue on 
      seen[i] = true # add the value to the seen hash
    end
  end

  def self.big_fake_array
    arr = []
    10000000.times do |a|
      arr << rand(9999)
    end
    arr << 10000
    arr << 99999
    f = File.new('testarray', 'w')
    f.write arr.join(",")
    f.close
    
  end
 

end

AddMeUp.big_fake_array

aa = AddMeUp.new(109999)
# # puts aa.basic
# # puts aa.sum_pairs
# puts(Benchmark.measure {aa.basic})
puts(Benchmark.measure {aa.cheat_result})
