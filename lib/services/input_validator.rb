require 'ostruct'

class InputValidator
  def initialize(path:, distance:)
    @path = path&.to_s
    @distance = distance&.to_s&.sub('km', '')&.to_i
  end

  def validate
    raise ArgumentError, "You must supply a file path to a list of customers as the first argument" if @path.nil? || @path == ""

    raise ArgumentError, "You must supply a kilometre distance greater than 0" if @distance.nil? || @distance <= 0

    OpenStruct.new({path: @path, distance: @distance})
  end
end
