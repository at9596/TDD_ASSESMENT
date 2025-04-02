# string_calculator.rb
class StringCalculator
  def add(numbers)
    # Return 0 if the input string is empty
    return 0 if numbers.empty?
    
     # Split the string by commas, convert each element to an integer, and sum them
    nums = numbers.split(',').map(&:to_i)
    nums.sum
  end
end
