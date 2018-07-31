require_relative "../lib/fizz_buzz.rb"
describe "fizzbuzz_helper()" do
  it 'returns "Fizz" when the number is divisible by 3' do
    fizz_3 = fizzbuzz_helper(3)
    expect(fizz_3).to eq("Fizz")
  end
  it 'returns "Buzz" when the number is divisible by 5' do
    fizz_5 = fizzbuzz_helper(5)
    expect(fizz_5).to eq("Buzz")
  end
  it 'returns "FizzBuzz" when the number is divisible by 3 and 5' do
    fizz_15 = fizzbuzz_helper(15)
    expect(fizz_15).to eq("FizzBuzz")
  end
  it 'returns the number when the number is not divisible by 3 or 5' do
    fizz_4 = fizzbuzz_helper(4)
    expect(fizz_4).to eq(4)
  end
end

describe "fizz_buzz" do
  it 'returns the correct array when range is 100' do
    correct = [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "FizzBuzz", 31, 32, "Fizz", 34, "Buzz", "Fizz", 37, 38, "Fizz", "Buzz", 41, "Fizz", 43, 44, "FizzBuzz", 46, 47, "Fizz", 49, "Buzz", "Fizz", 52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "FizzBuzz", 61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz", "Buzz", 71, "Fizz", 73, 74, "FizzBuzz", 76, 77, "Fizz", 79, "Buzz", "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz", 88, 89, "FizzBuzz", 91, 92, "Fizz", 94, "Buzz", "Fizz", 97, 98, "Fizz", "Buzz"]
    expect(fizz_buzz(100)).to eq correct 
  end
  it 'returns the correct array when max is 10' do 
    correct = [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz"]
    expect(fizz_buzz(10)).to eq correct
  end
end
