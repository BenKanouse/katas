class LRUCache
  require 'debug'

  attr_reader :capacity
  attr_accessor :cache

  class CacheItem
    attr_accessor :created_at
    attr_reader :key, :value

    def initialize(key:, value:)
      @key = key
      @value = value
      @created_at = Time.new.to_r
    end
  end

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end

  def get(key)
    return -1 if cache[key].nil?

    cache[key].created_at = Time.new.to_r
    cache[key]&.value
  end

  def put(key, value)
    evict if ((cache.count >= capacity) && cache[key].nil?)
    cache[key] = CacheItem.new(key:, value:)
  end

  private

  def evictee
    cache.min_by{ |_key, item| item.created_at }[1]
  end

  def evict
    cache.reject!{ |_key, item| item == evictee }
  end
end
