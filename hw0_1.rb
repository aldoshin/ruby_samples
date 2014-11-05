
# Define a method sum which takes an array of integers as an argument and returns 
# the sum of its elements. For an empty array it should return zero.
def sum(array)
    array.inject(0, :+)
end

# puts sum(1..5)

# Define a method max_2_sum which takes an array of integers as an argument and 
# returns the sum of its two largest elements. 
# For an empty array it should return zero. 
# For an array with just one element, it should return that element.
def max_2_sum(array)
    sum(array.sort.last(2))
end

# puts max_2_sum([1,2,3,4,5])
# puts max_2_sum([])
# puts max_2_sum([7])

# Define a method sum_to_n? which takes an array of integers and an additional 
# integer, n, as arguments and returns true if any two distinct elements 
# in the array of integers sum to n. 
# An empty array or single element array should both return false.
def sum_to_n?(array, n)
    array.combination(2).to_a.any? {|pair| sum(pair) == n }
end

# puts sum_to_n?((1..5).to_a, 3)
# puts sum_to_n?((1..5).to_a, 10)
# puts sum_to_n?([], 0)
# puts sum_to_n?([1], 1)