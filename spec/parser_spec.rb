# frozen_string_literal: true

require_relative './fixtures/transformed_search_data'

describe Parser do
  let(:builder) { double(:builder) }

  describe '.parse_journey' do
    before(:each) do
      allow(builder).to receive(:set_journey_option)
      allow(builder).to receive(:set_connection)
      allow(builder).to receive(:set_fare)

      allow(builder).to receive(:journey)
    end

    it 'should call set_journey_option twice' do
      expect(builder).to receive(:set_journey_option).exactly(2).times
      Parser.parse_journey(TRANSFORMED_SEARCH_DATA, builder)
    end

    it 'should call set_connection four times' do
      expect(builder).to receive(:set_connection).exactly(4).times
      Parser.parse_journey(TRANSFORMED_SEARCH_DATA, builder)
    end

    it 'should call set_fare eight times' do
      expect(builder).to receive(:set_fare).exactly(8).times
      Parser.parse_journey(TRANSFORMED_SEARCH_DATA, builder)
    end
  end
end
