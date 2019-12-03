class MiddleThing

  # initialize and accept an array of values
  def initialize(arr)
    @array = arr
  end

  # function to run over the array values
  def running
    output = []
    @array.each_with_index do |t,i|
      # add the current median value to the output array
      output << calculate_median(@array[0..i])
    end
    output
  end

  # input and array that returns the median value
  def calculate_median(values)
    count = values.count
    list_sort = values.sort

    # calculate the median position rounding up 
    avg_position = (count / 2.0).ceil

    # returns the median value or a calculation between the middle 2
    if count.even?
      nice_calculation_median(list_sort[avg_position] + list_sort[avg_position - 1])
    else
      list_sort[avg_position - 1] 
    end
  end

  # convert any integer values to rid us of the unwanted 0
  def nice_calculation_median(val)
    ncm = val / 2.0
    ncm = ncm.to_i if ncm == ncm.to_i
    ncm
  end

end

mt = MiddleThing.new([2, 1, 3])
puts mt.running.to_s