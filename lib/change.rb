# frozen_string_literal: true

require_relative 'time_rangeable'
class Change
  include TimeRangeable
  attr_reader :previous_connection, :following_connection

  def initialize(previous_connection:, following_connection:)
    @previous_connection = previous_connection
    @following_connection = following_connection
  end

  def start_time
    previous_connection.end_time
  end

  def end_time
    following_connection.start_time
  end

  def description
    { details: "Change: #{formatted_duration}" }
  end
end
