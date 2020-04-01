require_relative './lib/services/guestlist'
require_relative './lib/services/input_validator'

inputs = InputValidator.new(
  path: ARGV[0],
  distance: ARGV[1],
).validate

puts "Customers to invite within #{inputs.distance}km:"
puts "user_id | name"
puts Guestlist.new(
  customer_data_file_path: inputs.path,
  distance: inputs.distance,
).print
