# merge_sort
# divides an array into two halves and merge_sort each half
def merge_sort(arr)
    if arr.length <= 1
        return arr
    else
        median = arr.length / 2
        first_half = merge_sort(arr[0...median])
        second_half = merge_sort(arr[median..])
        return merge(first_half, second_half)
    end
end

# first_half: a sorted array
# second_half: a sorted array
# res: result array
# merge: merges two arrays and returns a sorted array
def merge(first_half, second_half, res = [])
    if first_half.empty?
        res + second_half
    elsif second_half.empty?
        res + first_half
    elsif first_half[0] < second_half[0]
        return merge(first_half[1..], second_half, res << first_half[0])
    else
        return merge(first_half, second_half[1..], res << second_half[0])
    end
end

# test cases

puts merge_sort([]) == [] # empty list
puts merge_sort([1]) == [1] # list of length 1
puts merge_sort([2,1]) == [1,2] # list of even length
puts merge_sort([1,2,3]) == [1,2,3] #already sorted list
puts merge_sort([5,4,3,2,1]) == [1,2,3,4,5] # list of odd length, reverse sorted
puts merge_sort([1,1,1,1]) == [1,1,1,1] # similarly sorted list