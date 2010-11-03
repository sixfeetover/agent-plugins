#!/usr/local/rvm/rubies/ruby-1.9.2-p0/bin/ruby
ENV['GEM_PATH'] = '/usr/local/rvm/gems/ruby-1.9.2-p0'
require 'rubygems'
require 'resque'

data = Resque.info
case data[:workers]
  when 0; puts 'status warn There are no resque workers running!' 
  else; puts 'status ok all systems go'
end

data.each do |k, v|
  next unless v.is_a?(Numeric)
  puts "metric #{k} int #{v}"
end

puts "metric processed_dt gauge #{data[:processed]}"
