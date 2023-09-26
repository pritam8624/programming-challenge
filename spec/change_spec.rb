# frozen_string_literal: true

describe Change do
  let(:previous_connection) { double(:connection) }
  let(:following_connection) { double(:connection) }

  let(:change) do
    Change.new(
      previous_connection: previous_connection,
      following_connection: following_connection
    )
  end

  describe '#start_time' do
    it 'should return the end time of the previous connection' do
      allow(previous_connection).to receive(:end_time) { 'previous connection end time' }

      expect(change.start_time).to eq 'previous connection end time'
    end
  end

  describe '#end_time' do
    it 'should return the start time of the following connection' do
      allow(following_connection).to receive(:start_time) { 'following connection start time' }

      expect(change.end_time).to eq 'following connection start time'
    end
  end

  describe '#description' do
    before(:each) do
      allow_any_instance_of(TimeRangeable).to receive(:formatted_duration) { 'some_formatted_duration' }
    end

    it 'should return a description for the change with its duration' do
      expected = {
        details: 'Change: some_formatted_duration'
      }

      expect(change.description).to eq expected
    end
  end
end
