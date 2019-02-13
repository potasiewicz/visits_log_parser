#!/usr/bin/env ruby
require 'require_all'
require_all('app')

begin
  VisitsLogApp.new(ARGV[0]).parse
rescue ArgumentError => e
  puts e.message
rescue RuntimeError => e
  puts e.message
end
