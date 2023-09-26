# frozen_string_literal: true

describe Journey do
  let(:journey_option1) { double(:journey_option) }
  let(:journey_option2) { double(:journey_option) }

  let(:journey) { Journey.new }

  describe '#initialize' do
    it 'should set an empty array of journey options' do
      expect(journey.journey_options).to eq []
    end
  end

  describe 'journey_options' do
    before(:each) do
      add_journey_option

      allow(journey_option1).to receive(:minimum_price) { 92.50 }
      allow(journey_option2).to receive(:minimum_price) { 75.50 }

      allow(journey_option1).to receive(:duration_in_seconds) { 2580 }
      allow(journey_option2).to receive(:duration_in_seconds) { 4000 }
    end

    describe '#add_journey_option' do
      it 'should add journey options to the journey options array' do
        expect(journey.journey_options.size).to eq 2
        expect(journey.journey_options.first).to eq journey_option1
      end
    end

    describe '#cheapest_option' do
      it 'should return the cheapest option for the journey' do
        expect(journey.cheapest_option).to eq journey_option2
      end
    end

    describe '#quickest_option' do
      it 'should return the quickest option for the journey' do
        expect(journey.quickest_option).to eq journey_option1
      end
    end

    describe '#last_option' do
      it 'should return the last journey option' do
        expect(journey.last_option).to eq journey_option2
      end
    end

    describe '#description' do
      it 'should return the description for the journey and for each option' do
        allow(journey_option1).to receive(:id) { 'id1' }
        allow(journey_option2).to receive(:id) { 'id2' }

        expected = {
          cheapest: 'Cheapest option: id2',
          quickest_option: 'Quickest option: id1'
        }

        expect(journey.description).to eq expected
      end
    end
  end

  private

  def add_journey_option
    journey.add_journey_option(journey_option1)
    journey.add_journey_option(journey_option2)
  end
end
