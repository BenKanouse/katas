# frozen_string_literal: true

class Median
  def self.run(nums1, nums2)
    # return self.easy_and_slow(nums1, nums2)
    new(nums1, nums2).run
  end

  def self.easy_and_slow(nums1, nums2)
    nums = (nums1 + nums2).sort
    length = nums.length

    if length.odd?
      nums[length / 2]
    else
      (nums[length / 2] + nums[length / 2 - 1]) / 2.0
    end
  end

  def initialize(nums1, nums2)
    if nums1.length <= nums2.length
      @shorter_nums = nums1
      @longer_nums = nums2
    else
      @shorter_nums = nums2
      @longer_nums = nums1
    end
  end

  attr_reader :shorter_nums, :longer_nums

  def run
    return median(longer_nums) if shorter_length.zero?

    if total_length.odd?
      odd_solution
    else
      even_solution
    end
  end

  private

  def odd_solution
    if short_index_equal_or_past_mean.nil?
      [
        shorter_nums.last,
        longer_nums[mean_index - shorter_length]
      ].max
    else
      [
        short_index_equal_or_past_mean.zero? ? -Float::INFINITY : shorter_nums[short_index_equal_or_past_mean - 1],
        longer_nums[mean_index - short_index_equal_or_past_mean]
      ].max
    end
  end

  def even_solution
    if short_index_equal_or_past_mean.nil?
      if shorter_length == longer_length
        (shorter_nums.last + longer_nums.first) / 2.0
      else
        items = [
          shorter_nums.last,
          longer_nums[mean_index - shorter_length],
          longer_nums[mean_index - shorter_length + 1]
        ].sort
        (items[1] + items[2]) / 2.0
      end
    else
      middle_numbers = [
        shorter_nums[short_index_equal_or_past_mean],
        short_index_equal_or_past_mean.zero? ? -Float::INFINITY : shorter_nums[short_index_equal_or_past_mean - 1],
        longer_nums[mean_index - short_index_equal_or_past_mean],
        longer_nums[mean_index - short_index_equal_or_past_mean + 1] || Float::INFINITY
      ].sort
      (middle_numbers[1] + middle_numbers[2]) / 2.0
    end
  end

  def short_index_equal_or_past_mean
    @short_index_equal_or_past_mean ||= (0...shorter_length).bsearch do |i|
      shorter_nums[i] >= longer_nums[mean_index - i]
    end
  end

  def shorter_length
    @shorter_length ||= shorter_nums.length
  end

  def longer_length
    @longer_length ||= longer_nums.length
  end

  def total_length
    @total_length ||= shorter_length + longer_length
  end

  def mean_index
    @mean_index ||= (total_length - 1) / 2
  end

  def median(nums)
    length = nums.length
    if length.odd?
      nums[length / 2]
    else
      (nums[length / 2] + nums[length / 2 - 1]) / 2.0
    end
  end
end
