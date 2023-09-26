# frozen_string_literal: true

class Journey
  attr_reader :journey_options

  def initialize
    @journey_options = []
  end

  def add_journey_option(journey_option)
    journey_options.push(journey_option)
  end

  def cheapest_option
    journey_options.min_by(&:minimum_price)
  end

  def quickest_option
    journey_options.min_by(&:duration_in_seconds)
  end

  def last_option
    journey_options.last
  end

  def description
    {
      cheapest: "Cheapest option: #{cheapest_option.id}",
      quickest_option: "Quickest option: #{quickest_option.id}"
    }
  end
end
