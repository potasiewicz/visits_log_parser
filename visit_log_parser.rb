#!/usr/bin/env ruby
require 'require_all'
require_all('app')

file = ARGV[0]
unless file
  puts 'File missing! Add as first argument file with logs in format "#path #IP"'
  return
end

data = FileReader.new(file).to_hash

puts 'List of webpages with most page views ordered from most pages views to less page views: '
ConsoleOutputWriter.new  WebStatistics.new(data).most_visited_pages
puts ''
puts 'list of webpages with most unique page views also ordered: '
ConsoleOutputWriter.new  WebStatistics.new(data).most_unique_visited_pages, 'unique views'
