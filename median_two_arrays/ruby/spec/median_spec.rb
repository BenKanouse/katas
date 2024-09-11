# frozen_string_literal: true

require 'rspec'
require './median'

describe Median do
  it 'even length' do
    expect(described_class.run([1,2], [3,4])).to eq 2.5
  end

  it 'odd length' do
    expect(described_class.run([1,2], [3])).to eq 2
  end

  it 'unsorted' do
    expect(described_class.run([2,6], [3,7])).to eq 4.5
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
