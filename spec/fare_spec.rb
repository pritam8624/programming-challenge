# frozen_string_literal: true

describe Fare do
  before(:each) do
    @fare = Fare.new(name: 'Some Name', price: '25.10', currency: 'GBP')
  end

  describe '#initialize' do
    it 'should set the name' do
      expect(@fare.name).to eq 'Some Name'
    end

    it 'should set the price' do
      expect(@fare.price).to eq 25.10
    end

    it 'should set the currency' do
      expect(@fare.currency).to eq 'GBP'
    end
  end

  describe '#to_s' do
    it 'should return the string format for the fare' do
      expect(@fare.to_s).to eq 'Some Name: 25.10 GBP'
    end
  end
end
