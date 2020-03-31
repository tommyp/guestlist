require_relative "../../lib/services/importer"

describe Importer do
  subject { described_class.new(file_path) }

  context "with no file_path supplied" do
    let(:file_path) { nil }

    it "raises an error" do
      expect { subject.call } .to raise_error("You must supply a path to a valid file.")
    end
  end

  context "with a path to a file that doesn't exist" do
    let(:file_path) { "./some/non/existant/file.txt" }

    it "raises an error" do
      expect { subject.call } .to raise_error("It looks like there isn't a valid file at ./some/non/existant/file.txt.")
    end
  end

  context "with a file path" do
    let(:file_path) { "./data/customers.txt" }

    let(:expected_first_imported_customer) {
      Customer.new({
        user_id: 12,
        name: "Christina McArdle",
        latitude: "52.986375",
        longitude: "-6.043701",
      })
    }

    it "imports a customer" do
      first_imported_customer = subject.call.first
      expect(first_imported_customer.user_id).to eq(expected_first_imported_customer.user_id)
      expect(first_imported_customer.name).to    eq(expected_first_imported_customer.name)
      expect(first_imported_customer.lat).to     eq(expected_first_imported_customer.lat)
      expect(first_imported_customer.lng).to     eq(expected_first_imported_customer.lng)
    end
  end
end
