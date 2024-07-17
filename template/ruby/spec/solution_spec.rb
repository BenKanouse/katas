# frozen_string_literal: true

require 'rspec'
require './solution'

describe Solution do
  it 'returns nil' do
    expect(described_class.new.run).to eq nil
  end
end
