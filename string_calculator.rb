class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    
    numbers,delimiters = extract_delimiters(numbers, delimiters)

    regex_pattern = Regexp.union(delimiters)
    nums = numbers.split(regex_pattern).map(&:to_i)
    
    negatives = handle_negatives(nums)
    
    nums.reject { |num| num > 1000 }.sum
  end

  private
  def extract_delimiters(numbers, delimiters)
    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)
      custom_delimiters = delimiter_section[2..]

      if custom_delimiters.start_with?("[")
        delimiters += custom_delimiters.scan(/\[(.*?)\]/).flatten
      else
        delimiters << custom_delimiters[0]
      end
    end
    
    [numbers, delimiters]
  end

  def handle_negatives(nums)
    negatives = nums.select { |num| num < 0 }
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    
    nums
  end
end