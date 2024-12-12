def counting_sort(array, max_value)
  num_counts = Array.new(max_value + 1, 0)
  array.each do |item|
    num_counts[item] += 1
  end

  sorted_array = []
  num_counts.each_with_index do |count, item|
    count.times { sorted_array << item }
  end

  sorted_array
end

arr = [4, 2, 2, 8, 3, 3, 1]
max_value = arr.max
sorted_arr = counting_sort(arr, max_value)
Rails.logger.debug { "Counted array = #{sorted_arr}" }
