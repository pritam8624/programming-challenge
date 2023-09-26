# frozen_string_literal: true

class DemoClass
  include TimeRangeable

  def start_time
    '2022-06-02T09:23:00+01:00'
  end

  def end_time
    '2022-06-02T12:41:00+02:00'
  end
end

describe TimeRangeable do
  let(:demo_class) { DemoClass.new }

  describe '#duration_in_seconds' do
    it 'should return the duration of the range in seconds' do
      expect(demo_class.duration_in_seconds).to eq 8280
    end
  end

  describe '#formatted_duration' do
    it 'should return the string version for the duration' do
      expect(demo_class.formatted_duration).to eq '2hr 18m'
    end
  end

  describe '#start_time_to_s' do
    it 'should return the string version for the start time' do
      expect(demo_class.start_time_to_s).to eq '09:23 02 Jun 2022 +0100'
    end
  end

  describe '#end_time_to_s' do
    it 'should return the string version for the end time' do
      expect(demo_class.end_time_to_s).to eq '12:41 02 Jun 2022 +0200'
    end
  end
end
