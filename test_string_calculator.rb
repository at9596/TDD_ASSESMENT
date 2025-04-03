require 'minitest/autorun'
require_relative 'string_calculator'

class TestStringCalculator < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string
    assert_equal 0, @calculator.add("")
  end

  def test_single_number
    assert_equal 1, @calculator.add("1")
  end

  def test_two_numbers
    assert_equal 6, @calculator.add("1,5")
  end

  def test_numbers_with_new_lines
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_negative_numbers
    assert_raises(RuntimeError) { @calculator.add("1,-2,3,-4") }
  end

  def test_ignore_numbers_greater_than_1000
    assert_equal 2, @calculator.add("2,1001")
    assert_equal 1002, @calculator.add("2,1000,1001")
    assert_equal 0, @calculator.add("1001,2000")
  end

  def test_delimiters_of_any_length
    assert_equal 6, @calculator.add("//[***]\n1***2***3")
    assert_equal 10, @calculator.add("//[###]\n4###3###3")
  end

  def test_multiple_delimiters
    assert_equal 6, @calculator.add("//[*][%]\n1*2%3")
    assert_equal 10, @calculator.add("//[**][%%]\n2**3%%5")
  end

  def test_multiple_delimiters_of_any_length
    assert_equal 6, @calculator.add("//[***][%%%]\n1***2%%%3")
    assert_equal 15, @calculator.add("//[###][$$$]\n4###5$$$6")
  end
end
