# frozen_string_literal: true

class Parser
  def self.parse_journey(search_data, builder = JourneyBuilder.new)
    search_data[:journey_options].each do |journey_option|
      builder.set_journey_option(id: journey_option[:id])
      journey_option[:connections].each do |connection|
        builder.set_connection(connection)
        connection[:fares].each do |fare|
          builder.set_fare(fare)
        end
      end
    end

    builder.journey
  end
end
