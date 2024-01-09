class LRUCache
  attr_reader :capacity
  attr_accessor :cache

  class CacheItem
    attr_accessor :used_at
    attr_reader :key, :value

    def initialize(key:, value:)
      @key = key
      @value = value
      @used_at = Time.now.to_r
    end
  end

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end

  def get(key)
    return -1 if cache[key].nil?

    cache[key].used_at = Time.now.to_r
    cache[key]&.value
  end

  def put(key, value)
    evict if ((cache.count >= capacity) && cache[key].nil?)
    cache[key] = CacheItem.new(key:, value:)
  end

  private

  def evictee
    cache.min_by{ |_key, item| item.used_at }[1]
  end

  def evict
    item_to_evict = evictee
    cache.reject!{ |_key, item| item == item_to_evict }
  end
end
