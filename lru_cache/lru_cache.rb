class LRUCache
  attr_reader :capacity
  attr_accessor :cache

  class CacheItem
    attr_reader :key, :value, :created_at

    def initialize(key:, value:)
      @key = key
      @value = value
      @created_at = Time.new.to_f
    end
  end

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end

  def get(key)
    cache[key]&.value || -1
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
