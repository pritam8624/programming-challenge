# frozen_string_literal: true

describe JourneyOption do
  let(:connection1) { double(:connection) }
  let(:connection2) { double(:connection) }
  let(:connection3) { double(:connection) }
  let(:connection4) { double(:connection) }

  let(:journey_option) { JourneyOption.new(id: 'AESD52') }

  describe '#initialize' do
    it 'should set the id for the journey option' do
      expect(journey_option.id).to eq 'AESD52'
    end

    it 'should set an empty array of connections' do
      expect(journey_option.connections).to eq []
    end
  end

  describe 'connections' do
    before(:each) do
      add_four_connections
    end

    describe '#add_connection' do
      it 'should add connections to the `connections` array' do
        expect(journey_option.connections.size).to eq 4
        expect(journey_option.connections.first).to eq connection1
        expect(journey_option.connections.last).to eq connection4
      end
    end

    describe '#minimum_price' do
      it 'should return the sum of the minimum price for each connection' do
        allow(connection1).to receive(:minimum_price) { 55.50 }
        allow(connection2).to receive(:minimum_price) { 45.50 }
        allow(connection3).to receive(:minimum_price) { 30.25 }
        allow(connection4).to receive(:minimum_price) { 10.50 }

        expect(journey_option.minimum_price).to eq 141.75
      end
    end

    describe '#start_time' do
      it 'should return the start time of the first connection' do
        allow(connection1).to receive(:start_time) { 'first connection start time' }

        expect(journey_option.start_time).to eq 'first connection start time'
      end
    end

    describe '#end_time' do
      it 'should return the end time of the last connection' do
        allow(connection4).to receive(:end_time) { 'last connection end time' }

        expect(journey_option.end_time).to eq 'last connection end time'
      end
    end

    describe '#last_connection' do
      it 'should return the last connection' do
        expect(journey_option.last_connection).to eq connection4
      end
    end
  end

  describe 'when there is more than one connection' do
    let(:change) { double(:change) }

    before(:each) do
      allow(Change)
        .to receive(:new)
        .with(previous_connection: connection1, following_connection: connection2)
        .and_return(change)

      journey_option.add_connection(connection1)
      journey_option.add_connection(connection2)
    end

    describe '#changes' do
      it 'should instantiate one new Change object for each pair of consecutive connections' do
        expect(journey_option.changes.size).to eq 1
        expect(journey_option.changes.first).to eq change
      end
    end

    describe '#description' do
      it 'should return the description for the option' do
        allow_any_instance_of(TimeRangeable).to receive(:formatted_duration) { 'some_formatted_duration' }

        expected = {
          details: 'ID: AESD52',
          duration: 'Duration: some_formatted_duration',
          number_of_changes: 'Number of changes: 1'
        }

        expect(journey_option.description).to eq expected
      end
    end

    describe '#journey_sequence' do
      it 'should return the journey sequence in the correct order' do
        expected = [
          connection1,
          change,
          connection2
        ]

        expect(journey_option.journey_sequence).to eq expected
      end
    end
  end

  private

  def add_four_connections
    journey_option.add_connection(connection1)
    journey_option.add_connection(connection2)
    journey_option.add_connection(connection3)
    journey_option.add_connection(connection4)
  end
end
