# frozen_string_literal: true

require 'rspec'
require './time_conversion'

describe TimeConversion do
  it 'returns values in the AM' do
    expect(described_class.run('07:05:45AM')).to eq '07:05:45'
  end

  it 'returns values in the PM' do
    expect(described_class.run('07:05:45PM')).to eq '19:05:45'
  end

  it 'returns noon' do
    expect(described_class.run('12:00:00PM')).to eq '12:00:00'
  end

  it 'returns values after noon' do
    expect(described_class.run('12:01:00PM')).to eq '12:01:00'
  end

  it 'returns midnight' do
    expect(described_class.run('12:00:00AM')).to eq '00:00:00'
  end

  it 'returns values slightly after midnight' do
    expect(described_class.run('12:12:12AM')).to eq '00:12:12'
  end

  it 'handles values without seconds' do
    expect(described_class.run('12:01PM')).to eq '12:01:00'
  end

  it 'handles a space between seconds and period' do
    expect(described_class.run('12:01 PM')).to eq '12:01:00'
  end
end
