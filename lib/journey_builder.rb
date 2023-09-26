# frozen_string_literal: true

class JourneyBuilder
  attr_reader :journey

  def initialize
    @journey = Journey.new
  end

  def set_journey_option(journey_option_data)
    journey.add_journey_option(JourneyOption.new(id: journey_option_data[:id]))
  end

  def set_connection(connection_data)
    connection_data_without_fares = connection_data.reject { |key, _value| key == :fares }
    journey.last_option.add_connection(Connection.new(connection_data_without_fares))
  end

  def set_fare(fare_data)
    journey.last_option.last_connection.add_fare(Fare.new(fare_data))
  end
end
