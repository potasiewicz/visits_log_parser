# frozen_string_literal: true

class VisitsLogApp
  def initialize(file)
    unless file
      raise ArgumentError, 'wrong number of arguments (0 for 1). Add file with page visits logs in format "#path #IP"'
    end

    @file = file
  end

  def parse
    data = FileReader.new(@file).to_hash

    puts 'List of webpages with most page views ordered from most pages views to less page views:'
    ConsoleOutputWriter.new(WebStatistics.new(data).most_visited_pages)

    puts 'List of webpages with most unique page views also ordered:'
    ConsoleOutputWriter.new(WebStatistics.new(data).most_unique_visited_pages, 'unique views')
  end
end
