require 'rspec'
require 'debug'

require "./lru_cache.rb"

describe LRUCache do
  it 'README example' do
    lru_cache = LRUCache.new 2
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    expect(lru_cache.get(1)).to eq 1
    lru_cache.put(3, 3)
    expect(lru_cache.get(2)).to eq -1
    lru_cache.put(4, 4)
    expect(lru_cache.get(1)).to eq -1
    expect(lru_cache.get(3)).to eq 3
    expect(lru_cache.get(4)).to eq 4
  end

  it 'fetches values when they are different than the key' do
    lru_cache = LRUCache.new 2
    expect(lru_cache.get(2)).to eq -1
    lru_cache.put(2, 6)
    expect(lru_cache.get(1)).to eq -1
    lru_cache.put(1, 5)
    lru_cache.put(1, 2)
    expect(lru_cache.get(1)).to eq 2
    expect(lru_cache.get(2)).to eq 6
  end

  it 'updates cache order on put' do
    lru_cache = LRUCache.new 2
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    lru_cache.put(1, 11)
    lru_cache.put(3, 3)
    expect(lru_cache.get(1)).to eq 11
    expect(lru_cache.get(2)).to eq -1
    expect(lru_cache.get(3)).to eq 3
  end

  it 'puts one value' do
    lru_cache = LRUCache.new 1
    lru_cache.put(1, 'something')
  end

  it 'evicts oldest value' do
    lru_cache = LRUCache.new 1
    lru_cache.put(1, 'something')
    expect(lru_cache.get(1)).to eq 'something'
    lru_cache.put(5, 'something_else')
    expect(lru_cache.get(1)).to eq -1
  end

  it 'works with capacity 3' do
    lru_cache = LRUCache.new 3
    lru_cache.put(1, 'something')
    expect(lru_cache.get(1)).to eq 'something'
    lru_cache.put(5, 'something_else')
    lru_cache.put(3, 'a third thing')
    expect(lru_cache.get(1)).to eq 'something'
    expect(lru_cache.get(5)).to eq 'something_else'
    expect(lru_cache.get(3)).to eq 'a third thing'
    lru_cache.put(77, 925)
    expect(lru_cache.get(1)).to eq -1
    expect(lru_cache.get(5)).to eq 'something_else'
    expect(lru_cache.get(3)).to eq 'a third thing'
    expect(lru_cache.get(77)).to eq 925
  end
end
