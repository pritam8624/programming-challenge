# frozen_string_literal: true

require_relative 'time_rangeable'
class Connection
  include TimeRangeable
  attr_reader :start, :finish, :start_time, :end_time, :train_name, :fares

  def initialize(start:, finish:, start_time:, end_time:, train_name:)
    @start = start
    @finish = finish
    @start_time = start_time
    @end_time = end_time
    @train_name = train_name
    @fares = []
  end

  def add_fare(fare)
    fares.push(fare)
  end

  def minimum_fare
    fares.min_by(&:price)
  end

  def minimum_price
    minimum_fare.price
  end

  def description
    {
      details: "Connection from #{start} to #{finish} on #{train_name}",
      departure: "Departure at #{start_time_to_s}",
      arrival: "Arrival at #{end_time_to_s}",
      duration: "Duration: #{formatted_duration}",
      fares: fares_descriptions
    }
  end

  private

  def fares_descriptions
    fares.map(&:to_s)
  end
end
