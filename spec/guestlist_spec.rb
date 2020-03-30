require 'tempfile'
require_relative "../app/guestlist"
require_relative "../app/importer"
require_relative "../app/location"

describe Guestlist do
  subject {
    described_class.new(
      customer_data_file_path: path,
      distance: distance,
    )
  }

  let(:customer_params) {
    {
      user_id: 1,
      name: "John Smith",
      longitude: 50.000,
      latitude: 1.000,
    }
  }

  let(:path) { "./test_data/customers.txt" }
  let(:distance) { 100 }

  let(:importer) {
    double(:importer,
      call: [customer]
    )
  }

  let(:customer) {
    double(:customer,
      user_id: 1,
      name: "John Smith",
    )
  }

  before do
    allow(customer).to receive(:within_kilometres_of_dublin_office?).with(distance).and_return(true)
  end

  it "passes the arguments to other classes and prints" do
    expect(Importer).to receive(:new).with(path).and_return(importer)
    expect(customer).to receive(:within_kilometres_of_dublin_office?).with(distance)
    expect(subject.print).to eq("      1 | John Smith")
  end

end
