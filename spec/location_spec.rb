require 'spec_helper'
require_relative "../app/location"

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

  describe "#kilometres_to_dublin_office" do
    context 'from London to Dublin' do
      let(:lat) { 51.5055481 }
      let(:lng) { -0.1329171 }

      it "calculates the distance" do
        expect(subject.kilometres_to_dublin_office).to eq(462)
      end
    end

    context 'from Belfast to Dublin' do
      let(:lat) { 54.5965421 }
      let(:lng) { -5.9523907 }

      it "calculates the distance" do
        expect(subject.kilometres_to_dublin_office).to eq(141)
      end
    end
  end
end
