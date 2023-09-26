# frozen_string_literal: true

describe Connection do
  let(:fare1) { double(:fare) }
  let(:fare2) { double(:fare) }

  let(:connection) do
    Connection.new(
      start: 'London',
      finish: 'Paris',
      start_time: 'start time',
      end_time: 'end time',
      train_name: 'Some Train Name'
    )
  end

  describe '#initialize' do
    it 'should set the start point' do
      expect(connection.start).to eq 'London'
    end

    it 'should set the finish point' do
      expect(connection.finish).to eq 'Paris'
    end

    it 'should set the start time' do
      expect(connection.start_time).to eq 'start time'
    end

    it 'should set the end time' do
      expect(connection.end_time).to eq 'end time'
    end

    it 'should set the train name' do
      expect(connection.train_name).to eq 'Some Train Name'
    end

    it 'should set an empty array of fares' do
      expect(connection.fares).to eq []
    end
  end

  describe 'fares' do
    before(:each) do
      add_fares

      allow(fare1).to receive(:price) { 55.50 }
      allow(fare2).to receive(:price) { 35.50 }
    end

    describe '#add_fares' do
      it 'should add fares to the `fares` array' do
        expect(connection.fares.size).to eq 2
        expect(connection.fares.first).to eq fare1
      end
    end

    describe '#minimum_fare' do
      it 'should return the lowest fare' do
        expect(connection.minimum_fare).to eq fare2
      end
    end

    describe '#minimum_price' do
      it 'should return the lowest price' do
        expect(connection.minimum_price).to eq 35.50
      end
    end
  end

  describe '#description' do
    before(:each) do
      add_fares

      allow(fare1).to receive(:to_s) { 'fare 1 string' }
      allow(fare2).to receive(:to_s) { 'fare 2 string' }

      allow_any_instance_of(TimeRangeable).to receive(:start_time_to_s) { 'some_formatted_start_time' }
      allow_any_instance_of(TimeRangeable).to receive(:end_time_to_s) { 'some_formatted_end_time' }
      allow_any_instance_of(TimeRangeable).to receive(:formatted_duration) { 'some_formatted_duration' }
    end

    it 'should return a description for the connection and its fares' do
      expected = {
        details: 'Connection from London to Paris on Some Train Name',
        departure: 'Departure at some_formatted_start_time',
        arrival: 'Arrival at some_formatted_end_time',
        duration: 'Duration: some_formatted_duration',
        fares: [
          'fare 1 string',
          'fare 2 string'
        ]
      }

      expect(connection.description).to eq expected
    end
  end

  private

  def add_fares
    connection.add_fare(fare1)
    connection.add_fare(fare2)
  end
end
