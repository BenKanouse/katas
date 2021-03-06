require 'simplecov'
SimpleCov.start

require "minitest/autorun"
require_relative "led.rb"

class LedTest < Minitest::Test
  def test_one
    one = <<ONE
   
  |
  |
ONE
    assert_equal Led.new.print(1), one
  end

  def test_twelve
    twelve = <<TWELVE
    _ 
  | _|
  ||_ 
TWELVE
    assert_equal Led.new.print(12), twelve
  end

  def test_one_to_zero
    numbers = <<NUM
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
NUM
    assert_equal Led.new.print(1234567890), numbers
  end

  def test_big_two
    big_two = <<TWO
 ___ 
    |
 ___|
|    
|___ 
TWO
    assert_equal Led.new(2,3).print(2), big_two
  end
  def test_big_twenty_seven
    big_twenty_seven = <<TWENTY_SEVEN
 ___  ___ 
    |    |
 ___|    |
|        |
|___     |
TWENTY_SEVEN
    assert_equal Led.new(2,3).print(27), big_twenty_seven
  end
end
