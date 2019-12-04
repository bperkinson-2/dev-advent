# QUESTION #2 
# Given a array of numbers representing the stock prices of a company in chronological order, write a function that calculates the maximum profit you could have made from buying and selling that stock once. You must buy before you can sell it. For example, given [9, 11, 8, 5, 7, 10], you should return 5, since you could buy the stock at 5 dollars and sell it at 10 dollars.

class Stock
  require 'benchmark'
  def initialize(array)
    @array = array
  end

  # find the min and max values
  # use that as the maximum possible
  # if the min is before the max break return that
  # if not take the max and find the smallest before that
  # if so take the min and find the largest
  def crunch
    final_list = {}
    @array.each_with_index do |a,i|
      # final_list[a] = @array[i..-1].select{|e| e > a} if final_list[a].nil?
      final_list[a] = @array.drop(1).max if final_list[a].nil?
    end
    puts final_list
    max_profit = 0
    final_list.each do |k, v|
      difference = max_diff(k,v)
      max_profit = difference if !difference.nil? && difference > max_profit
    end
    puts max_profit
  end

  def max_diff(k, values)
    # values.max - k.to_i unless values == []
    values - k.to_i unless values == []
  end

  # generate data
  def self.big_fake_array
    arr = []
    100000.times do |a|
      arr << rand(0..100000)
    end
    arr
  end

end

s = Stock.new([9, 11, 8, 5, 7, 10])
s.crunch


s = Stock.new([9, 11, 8, 5, 7, 10, 1, 100])
s.crunch

s = Stock.new([9, 11, 8, 5, 7, 10,12,5,6])
s.crunch

s = Stock.new(Stock.big_fake_array)
puts(Benchmark.measure {s.crunch})