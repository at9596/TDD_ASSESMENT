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
end