require "spec_helper"

describe Validatin do
  it "Has a version number" do
    expect(Validatin::VERSION).not_to be nil
  end

  describe "#syntax_valid?" do

    context "Without specifying a country" do
      subject { described_class.new(tin).syntax_valid? }

      context "With a valid TIN" do
        let(:tin) { "12345678901" }

        it { should be true }
      end

      context "With an invalid TIN" do
        let(:tin) { "ABCD" }

        it { should be false }
      end
    end

    context "Specifying a country" do
      let(:country_code) { :at }
      subject { described_class.new(tin, country_code).syntax_valid? }

      context "With a valid TIN" do
        let(:tin) { "12-123/1234" }

        it { should be true }
      end

      context "With an invalid TIN" do
        let(:tin) { "12345678901" }

        it { should be false }
      end
    end
  end
end
