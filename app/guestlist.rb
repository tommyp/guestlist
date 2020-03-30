require_relative "./importer"

class Guestlist
  def initialize(customer_data_file_path:, distance:)
    @customer_data_file_path = customer_data_file_path
    @distance = distance
  end

  def print
    @customers = import_customers
    @customers = customers_within_distance
    @customers = sort_customers

    present
  end


  private

  def import_customers
    Importer.new(@customer_data_file_path).call
  end

  def customers_within_distance
    @customers.select { |c| c.within_kilometres_of_dublin_office?(@distance) }
  end

  def sort_customers
    @customers.sort_by { |customer| customer.user_id }
  end

  def present
    @customers.map { |customer|
      "#{customer.user_id.to_s.rjust(7)} | #{customer.name}"
    }.join("\n")
  end

end

