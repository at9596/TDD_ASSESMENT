class StringCalculator
  def add(numbers)
    # Return 0 if the input string is empty
    return 0 if numbers.empty?

    # If the string starts with "//", it indicates a custom delimiter
    if numbers.start_with?("//")
      # Check if the delimiter is enclosed in square brackets
      if numbers[2] == "["
        # Extract the custom delimiter from within the square brackets
        delimiter = numbers[3..numbers.index("]\n") - 1]
        # Remove the custom delimiter line from the string
        numbers = numbers[numbers.index("]\n") + 2..-1]
      else
        # Extract the custom delimiter (single character) from the string
        delimiter = numbers[2..numbers.index("\n") - 1]
        # Remove the custom delimiter line from the string
        numbers = numbers[numbers.index("\n") + 1..-1]
      end
      # Replace the custom delimiter with a comma
      numbers = numbers.gsub(delimiter, ",")
    else
      # Replace new line characters with commas
      numbers = numbers.gsub("\n", ",")
    end

    # Split the string by commas, convert each element to an integer
    nums = numbers.split(',').map(&:to_i)

    # Find all negative numbers in the parsed input
    negatives = nums.select { |num| num < 0 }

    # If any negative numbers are found, raise an exception with the list of negative numbers
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    # Ignore numbers greater than 1000 and calculate the sum
    nums.reject { |num| num > 1000 }.sum
  end
end