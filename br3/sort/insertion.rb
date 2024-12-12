def insertion_sort(array)
  (1...array.length).each do |i|
    key = array[i]
    j = i - 1
    while j >= 0 && array[j] > key
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = key
  end
  array
end

arr = [22, 11, 99, 88, 9, 7, 42]
sorted_arr = insertion_sort(arr)
Rails.logger.debug { "Inserted array = #{sorted_arr}" }
