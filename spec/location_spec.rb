require 'spec_helper'
require_relative "../app/location"

describe Location do
  subject { described_class.new(lat: lat, lng: lng) }
  let(:lat) { nil }
  let(:lng) { nil }

  it { is_expected.to respond_to(:lat) }
  it { is_expected.to respond_to(:lng) }

  context "with a lat and a lng" do
    let(:lat) { 51.5285582 }
    let(:lng) { -0.2416808 }

    its(:lat)     { is_expected.to eq(51.5285582) }
    its(:lng)     { is_expected.to eq(-0.2416808) }
  end
end
