# string_calculator.rb
class StringCalculator
  def add(numbers)
    # Return 0 if the input string is empty
    return 0 if numbers.empty?
    # If the string starts with "//", it indicates a custom delimiter
    if numbers.start_with?("//")
      # Extract the custom delimiter from the string
      delimiter = numbers[2..numbers.index("\n") - 1]
      # Remove the custom delimiter line from the string
      numbers = numbers[numbers.index("\n") + 1..-1]
      # Replace the custom delimiter with a comma
      numbers = numbers.gsub(delimiter, ",")
    else
      # Replace new line characters with commas
      numbers = numbers.gsub("\n", ",")
    end

     # Split the string by commas, convert each element to an integer, and sum them
    nums = numbers.split(',').map(&:to_i)
    nums.sum
  end
end
