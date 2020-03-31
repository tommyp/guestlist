require_relative "./location"

class Customer
  attr_reader :user_id, :name, :lat, :lng, :location

  def initialize(customer)
    @user_id = customer[:user_id]
    @name = customer[:name]
    @lat = customer[:latitude].to_f
    @lng = customer[:longitude].to_f

    @location = Location.new(
      lat: lat,
      lng: lng,
    )
  end

  def within_kilometres_of_dublin_office?(distance)
    location.within_kilometres_of_dublin_office?(distance)
  end
end
