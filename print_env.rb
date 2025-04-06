# frozen_string_literal: true

# filepath: /home/tom/paul/print_env.rb
puts 'Environment Variables:'
ENV.each do |key, value|
  puts "#{key}: #{value}"
end
