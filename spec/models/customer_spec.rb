require "spec_helper"
require_relative "../../app/models/customer"
require_relative "../../app/models/location"

describe Customer do
  subject { described_class.new(customer_params) }
  let(:customer_params) { {} }

  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:name) }

  context "with params sets those on the customer" do
    let(:customer_params) {
      {
        user_id: 123,
        name: "John Smith",
        latitude: 51.5285582,
        longitude: -0.2416808,
      }
    }

    its(:user_id)  { is_expected.to eq(123) }
    its(:name)     { is_expected.to eq("John Smith") }
    its(:lat)      { is_expected.to eq(51.5285582) }
    its(:lng)      { is_expected.to eq(-0.2416808) }
    its(:location) { is_expected.to be_a(Location) }
  end
end
