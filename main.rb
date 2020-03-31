require_relative './lib/services/guestlist'

path = ARGV[0]&.to_s
distance = ARGV[1]&.sub('km', '')&.to_i

raise ArgumentError, "You must supply a file path to a list of customers as the first argument" if path.nil? || path == ""
raise ArgumentError, "You must supply a kilometre distance greater than 0" if distance.nil? || distance <= 0

puts "Customers to invite within #{distance}km:"
puts "user_id | name"
puts Guestlist.new(
  customer_data_file_path: path,
  distance: distance,
).print
