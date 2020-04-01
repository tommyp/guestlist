require_relative "../../lib/services/input_validator"

describe InputValidator do
  subject { described_class.new(path: path, distance: distance) }
  let(:path) { nil }
  let(:distance) { nil }

  context "#validate" do
    context "with invalid inputs" do
      describe "when path is nil" do
        it "raises an error" do
          expect { subject.validate }.to raise_error("You must supply a file path to a list of customers as the first argument")
        end
      end

      describe "when distance is nil" do
        let(:path) { "path/to/a/file.txt" }

        it "raises an error" do
          expect { subject.validate }.to raise_error("You must supply a kilometre distance greater than 0")
        end
      end

      describe "when path is empty" do
        let(:path) { "" }

        it "raises an error" do
          expect { subject.validate }.to raise_error("You must supply a file path to a list of customers as the first argument")
        end
      end

      describe "when distance is negative" do
        let(:path) { "path/to/a/file.txt" }
        let(:distance) { -123 }

        it "raises an error" do
          expect { subject.validate }.to raise_error("You must supply a kilometre distance greater than 0")
        end
      end

      describe "when distance is zero" do
        let(:path) { "path/to/a/file.txt" }
        let(:distance) { 0 }

        it "raises an error" do
          expect { subject.validate }.to raise_error("You must supply a kilometre distance greater than 0")
        end
      end
    end

    context "with valid inputs" do
      let(:path) { "path/to/a/file.txt" }

      describe "when distance is greater than zero" do
        let(:output) { OpenStruct.new({path: path, distance: distance}) }
        let(:distance) { 123 }

        it "returns the inputs" do
          expect(subject.validate).to eq(output)
        end
      end

      describe "when distance is appended with 'km' " do
        let(:output) { OpenStruct.new({path: path, distance: 123}) }
        let(:distance) { "123km" }

        it "returns the inputs" do
          expect(subject.validate).to eq(output)
        end
      end
    end
  end
end
