def bubble_sort(array)
  arr_len = array.length
  if arr_len == 1
    return array
  elsif arr_len == 2
    if array[0] > array[1]
      temp = array[0]
      array[0] = array[1]
      array[1] = temp
    end
  else
    loop do
      sorted = true
      for i in 0..arr_len - 2 do
        if array[i] > array[i + 1]
          sorted = false
          temp = array[i]
          array[i] = array[i + 1]
          array[i + 1] = temp
        end
      end
      arr_len -= 1
      if sorted
        break
      end
    end
  end
  return array
end

p bubble_sort([2, 1, 4, 5, 3])