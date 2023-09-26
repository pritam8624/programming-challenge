# frozen_string_literal: true

describe JourneyBuilder do
  let(:builder) { JourneyBuilder.new }

  describe '#build' do
    it 'should return an object of the type journey' do
      expect(builder.journey).to be_a Journey
    end
  end

  describe 'set methods' do
    before(:each) do
      builder.set_journey_option({ id: 'some_id' })
      builder.set_journey_option({ id: 'some_other_id' })
      connection_data = {
        end_time: '2022-06-02T12:41:00+02:00',
        finish: 'Finish Station 1',
        start: 'Start Station 1',
        start_time: '2022-06-02T09:23:00+01:00',
        train_name: 'Train Name A',
        fares: []
      }
      builder.set_connection(connection_data)
    end

    describe '#set_journey_option' do
      it 'should add a journey option to the journey' do
        expect(builder.journey.journey_options.first).to be_a JourneyOption
        expect(builder.journey.journey_options.first.id).to eq 'some_id'
      end
    end

    describe '#set_connection' do
      it 'should add a connection to the latest journey option' do
        expected_connection = builder.journey.last_option.connections.first

        expect(expected_connection).to be_a Connection
        expect(expected_connection.train_name).to eq 'Train Name A'
      end
    end

    describe '#set_fare' do
      it 'should add a connection to the latest connection' do
        fare_data = {
          currency: 'GBP',
          name: 'Standard Premier',
          price: '11.00'
        }
        builder.set_fare(fare_data)

        expected_fare = builder.journey.last_option.last_connection.fares.first

        expect(expected_fare).to be_a Fare
        expect(expected_fare.name).to eq 'Standard Premier'
      end
    end
  end
end
