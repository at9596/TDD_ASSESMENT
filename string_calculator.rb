class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    
    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)
      custom_delimiters = delimiter_section[2..]

      if custom_delimiters.start_with?("[")
        delimiters += custom_delimiters.scan(/\[(.*?)\]/).flatten
      else
        delimiters << custom_delimiters[0]
      end
    end
    
    regex_pattern = Regexp.union(delimiters)
    nums = numbers.split(regex_pattern).map(&:to_i)
    
    negatives = nums.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    
    nums.reject { |num| num > 1000 }.sum
  end
end