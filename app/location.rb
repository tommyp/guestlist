class Location
  DUBLIN_OFFICE_LATITUDE = 53.339428
  DUBLIN_OFFICE_LONGITUDE = -6.257664

  RADIANS_PER_DEGREE = Math::PI/180
  EARTH_RADIUS_IN_KM = 6371
  RADIUS_IN_METRES = EARTH_RADIUS_IN_KM * 1000

  attr_reader :lat, :lng

  def initialize(lat:, lng:)
    @lat = lat
    @lng = lng
  end

  def within_kilometres_of_dublin_office?(distance)
    kilometres_to_dublin_office <= distance
  end

  private

  def metres_to_dublin_office
    cos_delta = Math.cos(lng * RADIANS_PER_DEGREE - DUBLIN_OFFICE_LONGITUDE * RADIANS_PER_DEGREE)
    sin_formula = Math.sin(lat * RADIANS_PER_DEGREE) * Math.sin(DUBLIN_OFFICE_LATITUDE * RADIANS_PER_DEGREE)
    cos_formula = Math.cos(lat * RADIANS_PER_DEGREE) * Math.cos(DUBLIN_OFFICE_LATITUDE * RADIANS_PER_DEGREE) * cos_delta

    Math.acos(sin_formula + cos_formula) * RADIUS_IN_METRES
  end

  def kilometres_to_dublin_office
    (metres_to_dublin_office / 1000).round
  end
end
