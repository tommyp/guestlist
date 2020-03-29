require 'json'

class Importer
  def initialize(file_path)
    @file_path = file_path.to_s # .to_s here ensures that we cast nil to an empty string
  end

  def call
    begin
      file = File.open(@file_path).read
      customers = []

      file.each_line do |line|
        customers << JSON.parse(line, symbolize_names: true)
      end

      customers
    rescue Errno::ENOENT
      if @file_path.empty?
        raise "You must supply a path to a valid file."
      else
        raise "It looks like there isn't a valid file at #{@file_path}."
      end
    end
  end
end
