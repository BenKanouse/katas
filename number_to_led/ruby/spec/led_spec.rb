require 'rspec'
require './led'

describe Led do

  it 'test_one' do
    one = <<ONE
   
  |
  |
ONE
    expect(Led.new.print(1)).to eq one
  end

  it 'test_twelve' do
    twelve = <<TWELVE
    _ 
  | _|
  ||_ 
TWELVE
    expect(Led.new.print(12)).to eq twelve
  end

  it 'test_one_to_zero' do
    numbers = <<NUM
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
NUM
    expect(Led.new.print(1234567890)).to eq numbers
  end

  it 'test_big_two' do
    big_two = <<TWO
 ___ 
    |
 ___|
|    
|___ 
TWO
    expect(Led.new(2,3).print(2)).to eq big_two
  end
  it 'test_big_twenty_seven' do
    big_twenty_seven = <<TWENTY_SEVEN
 ___  ___ 
    |    |
 ___|    |
|        |
|___     |
TWENTY_SEVEN
    expect(Led.new(2,3).print(27)).to eq big_twenty_seven
  end

end
