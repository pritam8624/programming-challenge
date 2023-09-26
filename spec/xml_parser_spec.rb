# frozen_string_literal: true

require_relative './fixtures/transformed_search_data'

FIXTURE_PATH = 'spec/fixtures/search_fixture.xml'

describe XMLParser do
  describe '.parse' do
    it 'should return a hash that fits the building of the models' do
      expect(XMLParser.parse(file_path: FIXTURE_PATH)).to eq(TRANSFORMED_SEARCH_DATA)
    end
  end
end
