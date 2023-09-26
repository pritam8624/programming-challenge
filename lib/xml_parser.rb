# frozen_string_literal: true

require 'ox'
class XMLParser
  def self.parse(file_path:)
    input_file = File.read(file_path)
    search_data = Ox.load(input_file, mode: :hash)
    transform_search_data(search_data)
  end

  def self.transform_search_data(search_data)
    result = { journey_options: [] }
    search_data[:SearchResults][:SearchResult].each do |search_result|
      journey_option = { id: search_result[:ID], connections: [] }
      search_result[:Connections][:Connection].each do |search_result_connection|
        connection = {
          start: search_result_connection[:Start],
          finish: search_result_connection[:Finish],
          start_time: search_result_connection[:DepartureTime],
          end_time: search_result_connection[:ArrivalTime],
          train_name: search_result_connection[:TrainName],
          fares: []
        }
        search_result_connection[:Fares][:Fare].each do |search_result_fare|
          fare = {
            name: search_result_fare[:Name],
            price: search_result_fare[:Price][:Value],
            currency: search_result_fare[:Price][:Currency]
          }
          connection[:fares].push(fare)
        end
        journey_option[:connections].push(connection)
      end
      result[:journey_options].push(journey_option)
    end
    result
  end
end
