def fizzbuzz_helper(number)
  #TODO:
  #Return 'Fizz' for multiples of 3
  #Return 'Buzz for multiples of 5
  #Return 'FizzBuzz' for multiples of 3 and 5
  if number % 5 == 0 and number % 3 == 0
        return "FizzBuzz"
      elsif number % 5 == 0
        return "Buzz"
      elsif number % 3 == 0
        return "Fizz"
      else
        return number
      end
end


def fizz_buzz(max)
  #TODO: Return an array of numbers converted to fizzbuzz
  # EX: fizz_buzz(5) = [1,2,"Fizz",4,"Buzz"]
end
