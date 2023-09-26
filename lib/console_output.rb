# frozen_string_literal: true

class ConsoleOutput
  JOURNEY_SEQUENCE_TITLE = 'Journey sequence:'
  JOURNEY_SECTION_SEPARATOR = '------------------------'
  NEW_LINE = "\n"

  def self.display(journey)
    output = []
    journey.journey_options.each do |option|
      output.push(option.description.values)
      output.push(JOURNEY_SEQUENCE_TITLE)
      option.journey_sequence_descriptions.each do |journey_section_description|
        output.push(JOURNEY_SECTION_SEPARATOR)
        output.push(journey_section_description.values)
      end
      output.push(NEW_LINE)
    end
    output.push(journey.description.values)
    output.join(NEW_LINE)
  end
end
