def fizzbuzz_helper(number)
  #TODO:
  #Return 'Fizz' for multiples of 3
  #Return 'Buzz for multiples of 5
  #Return 'FizzBuzz' for multiples of 3 and 5
  if (number % 15 == 0)
    "FizzBuzz"
  elsif (number % 5 == 0)
    "Buzz"
  elsif (number % 3 == 0)
    "Fizz"
  else
    number
  end
end


def fizz_buzz(max)
  (1..max).map {|i| fizzbuzz_helper(i)} 
  #TODO: Return an array of numbers converted to fizzbuzz
  # EX: fizz_buzz(5) = [1,2,"Fizz",4,"Buzz"]
end
