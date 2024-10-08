# frozen_string_literal: true

require 'rspec'
require './median'

describe Median do

  it 'odd length, all of nums1 is smaller than nums2' do
    expect(described_class.run([1, 2, 3], [4, 5, 6, 7])).to eq 4
  end

  it 'odd length, median is in num1' do
    expect(described_class.run([2, 3, 4], [1, 2, 5, 6])).to eq 3
  end

  it 'odd length, median is in num2' do
    expect(described_class.run([2, 2, 4], [1, 3, 5, 6])).to eq 3
  end

  it 'odd length, nums1 is empty' do
    expect(described_class.run([], [1])).to eq 1
  end

  it 'odd length, nums1 has 1 item, median is in nums1' do
    expect(described_class.run([2], [1, 3])).to eq 2
  end

  it 'odd length, nums1 has 1 item, median is in nums2' do
    expect(described_class.run([3], [-2, -1])).to eq -1
  end

  it 'odd length, many numbers are equal' do
    expect(described_class.run([1,1,1,1,1], [0,1,1,1,1,1,2])).to eq 1
  end

  it 'even length, all of nums1 is smaller than nums2' do
    expect(described_class.run([1, 2, 3, 4], [5, 6, 7, 8])).to eq 4.5
  end

  it 'even length, all of nums1 is smaller than nums2, nums1 length is smaller than nums2 length' do
    expect(described_class.run([1, 2], [3, 4, 5, 6])).to eq 3.5
  end

  it 'even length, all of nums1 is smaller than nums2, nums1 length is smaller than nums2 length' do
    expect(described_class.run([3, 4, 5, 6], [1, 2])).to eq 3.5
  end

  it 'even length, needed numbers are in nums2' do
    expect(described_class.run([1, 2, 5, 6], [2, 3, 4, 7])).to eq 3.5
  end

  it 'even length, needed numbers are in nums1' do
    expect(described_class.run([1, 2, 3, 4], [2, 5, 6, 7])).to eq 3.5
  end

  it 'even length, 1 is needed from nums1, 1 is needed from nums2.' do
    expect(described_class.run([1, 2, 2, 3], [4, 5, 6, 7])).to eq 3.5
  end

  it 'even length, all numbers are equal' do
    expect(described_class.run([1,1], [1,1])).to eq 1
  end

  it 'even length many numbers are equal' do
    expect(described_class.run([1, 2], [1, 1])).to eq 1
  end

  it 'even length, nums1 is empty' do
    expect(described_class.run([], [1, 2])).to eq 1.5
  end

  it 'even length, nums1 has 1 value, nums2 has the other' do
    expect(described_class.run([2], [1, 3, 4])).to eq 2.5
  end

  it 'even length, both values are in nums2' do
    expect(described_class.run([4], [1, 2, 3])).to eq 2.5
  end

  it 'even length size 2, values in nums2' do
    expect(described_class.run([1, 4], [2, 3])).to eq 2.5
  end

  it 'even length size 2, values in both' do
    expect(described_class.run([1, 2], [3, 4])).to eq 2.5
  end

  it 'can return quickly' do
    nums1 = ((1..20).to_a * 1_000_000).sort
    nums2 = ((20..40).to_a * 1_000_000).sort

    start_time = Time.now
    expect(described_class.run(nums1, nums2)).to eq 20
    end_time = Time.now - start_time
    puts end_time
    expect(end_time).to be <= 0.1
  end
end
