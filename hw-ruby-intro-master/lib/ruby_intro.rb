# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  s = 0
  for var in arr
    s += var
  end
  return s
end

def max_2_sum arr
  # YOUR CODE HERE
  max1 = -9999
  max2 = -9999

  # when array is empty
  if arr.length < 1
    return 0
  # when array contains only 1 element
  elsif arr.length < 2
    return arr.at(0)
  # when array contains more than 1 element
  else
    for var in arr
      if var > max1
        max2 = max1
        max1 = var
      elsif var > max2
        max2 = var
      end
    end
    return max1 + max2
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  # when array contains less than 2 elements
  if arr.length < 2
    return false
  # when array contains more than 2 elements
  else
    # use enumerator method to check 
    b = arr.chunk_while {|i, j| i+j == n}
    for var in b.to_a
      # if variable has two elements, that means sum_to_n is possible
      if var.length == 2
        return true
      end
    end
    return false
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  letter = s[0,1]
  # check if it starts with consonant
  if letter =~ /[aeiou]/ || letter =~ /[AEIOU]/
    return false
  # check if it starts with alphabet
  elsif letter =~ /[a-z]/ || letter =~ /[A-Z]/
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  # check if it's valid binary
  if (s =~ /[0-9]/ && s =~ /[a-z]/) || (s =~ /[0-9]/ && s =~ /[A-Z]/)
    return false
  # check if the input is binary
  elsif s =~ /[0-1]/
    i = s.to_i(2)                   # convert binary to integer
    if i % 4 == 0
      return true
    else
      return false
    end
  # check if the input is string
  elsif s =~ /[a-z]/ || s =~ /[A-Z]/
    asc = s.unpack("C*")            # convert string to integer
    for var in asc
      if var % 4 == 0
        return true
      else
        return false
      end
    end
  end
end

# Part 3

class BookInStock
# YOUR CODE HERE
  # constructor
  def initialize(i, p)
    if i == nil || i.size == 0
      raise ArgumentError.new('isbn is invalid')
    elsif p <= 0
      raise ArgumentError.new('price can\'t be zero or negative value')
    else
      @isbn, @price = i, p
    end
  end

  # getter
  def isbn
    @isbn
  end
  def price
    @price
  end

  # setter
  def isbn=(value)
    @isbn = value
  end
  def price=(value)
    @price = value
  end

  # method to return the price of book as string in "$.##" format
  def price_as_string
    return '$' + '%.2f' % @price
  end
end
