# frozen_string_literal: true

require_relative 'time_rangeable'
class JourneyOption
  include TimeRangeable
  attr_reader :id, :connections

  def initialize(id:)
    @id = id
    @connections = []
  end

  def add_connection(connection)
    connections.push(connection)
  end

  def start_time
    connections.first.start_time
  end

  def end_time
    connections.last.end_time
  end

  def last_connection
    connections.last
  end

  def minimum_price
    connections.map(&:minimum_price).reduce(:+)
  end

  def changes
    connections.each_cons(2).to_a.map do |previous_connection, following_connection|
      Change.new(
        previous_connection: previous_connection,
        following_connection: following_connection
      )
    end
  end

  def description
    {
      details: "ID: #{id}",
      duration: "Duration: #{formatted_duration}",
      number_of_changes: "Number of changes: #{changes.size}"
    }
  end

  def journey_sequence
    @connections.zip(changes).flatten.compact
  end

  def journey_sequence_descriptions
    journey_sequence.map(&:description)
  end
end
