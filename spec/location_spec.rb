require 'spec_helper'
require_relative "../app/models/location"

describe Location do
  subject { described_class.new(lat: lat, lng: lng) }

  describe "#new" do
    let(:lat) { nil }
    let(:lng) { nil }

    it { is_expected.to respond_to(:lat) }
    it { is_expected.to respond_to(:lng) }

    context "with a lat and a lng" do
      let(:lat) { 51.5285582 }
      let(:lng) { -0.2416808 }

      its(:lat) { is_expected.to eq(51.5285582) }
      its(:lng) { is_expected.to eq(-0.2416808) }
    end
  end

  describe "#within_kilometres_of_dublin_office?" do
    context 'when the location is London and distance is 100km' do
      let(:lat) { 51.5055481 }
      let(:lng) { -0.1329171 }
      # London is 462km away from Dublin

      let(:distance) { 100 }

      it "returns false" do
        expect(subject.within_kilometres_of_dublin_office?(distance)).to eq(false)
      end
    end

    context 'when the location is Belfast and distance is 150km' do
      let(:lat) { 54.5965421 }
      let(:lng) { -5.9523907 }
      # Belfast is 141km away from Dublin

      let(:distance) { 150 }

      it "returns true" do
        expect(subject.within_kilometres_of_dublin_office?(distance)).to eq(true)
      end
    end
  end
end
