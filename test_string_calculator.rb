# Test suite for the StringCalculator class
# Uses Minitest for testing: https://github.com/minitest/minitest
require 'minitest/autorun'  # Provides the testing framework
require_relative 'string_calculator'  # Includes the StringCalculator class definition

class TestStringCalculator < Minitest::Test
  # Setup method to initialize a new instance of StringCalculator before each test
  def setup
    @calculator = StringCalculator.new
  end

  # Test case: Verifies that the add method returns 0 when an empty string is passed
  def test_empty_string
    assert_equal 0, @calculator.add(""), "Expected 0 when input is an empty string"
  end

  # Test case: Verifies that the add method returns the number itself when a single number is passed
  def test_single_number
    assert_equal 1, @calculator.add("1")
  end
    # Test case: Verifies that the add method returns the sum of two numbers separated by a comma
  def test_two_numbers
    assert_equal 6, @calculator.add("1,5")
  end

  # Test case: Verifies that the add method correctly handles numbers separated by new lines
  def test_numbers_with_new_lines
    assert_equal 6, @calculator.add("1\n2,3")
  end

  # Test case: Verifies that the add method correctly handles custom delimiters
  def test_custom_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  # Test case: Verifies that the add method raises an error when negative numbers are included in the input
  def test_negative_numbers
    assert_raises(RuntimeError) { @calculator.add("1,-2,3,-4") }
  end

   # Test case: Numbers greater than 1000 should be ignored
   def test_ignore_numbers_greater_than_1000
    assert_equal 2, @calculator.add("2,1001"), "Expected 2 when input is '2,1001' (1001 should be ignored)"
    assert_equal 1002, @calculator.add("2,1000,1001"), "Expected 1002 when input is '2,1000,1001' (1001 should be ignored)"
    assert_equal 0, @calculator.add("1001,2000"), "Expected 0 when input is '1001,2000' (all numbers are ignored)"
  end
  
  # Test case: Verifies that the add method correctly handles delimiters of any length
  def test_delimiters_of_any_length
    assert_equal 6, @calculator.add("//[***]\n1***2***3"), "Expected 6 when input is '1***2***3' with delimiter '***'"
    assert_equal 10, @calculator.add("//[###]\n4###3###3"), "Expected 10 when input is '4###3###3' with delimiter '###'"
  end
end