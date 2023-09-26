# frozen_string_literal: true

Dir['../programming-challenge/lib/*.rb'].each { |file| require_relative file.to_s }

file_path = ARGV[0] || './task/search.xml'

search_data = XMLParser.parse(file_path: file_path)

journey = Parser.parse_journey(search_data)

puts ConsoleOutput.display(journey)
