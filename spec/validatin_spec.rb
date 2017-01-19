require "spec_helper"

describe Validatin do
  it "Has a version number" do
    expect(Validatin::VERSION).not_to be nil
  end

  describe "#valid_syntax?" do
    context "Without specifying a country" do
      let(:tin) { VALID_AT_TIN }
      it { expect { described_class.new(tin).valid_syntax? }.to raise_error }
    end

    context "Specifying a country" do
      let(:country_code) { :es }
      subject { described_class.new(tin, country_code).valid_syntax? }

      context "With a valid TIN" do
        let(:tin) { VALID_ES_TIN }
        it { should be true }
      end

      context "With an invalid TIN" do
        let(:tin) { INVALID_TIN }
        it { should be false }
      end
    end
  end

  describe "#valid_structure?" do
    context "Without specifying a country" do
      subject { described_class.new(tin).valid_structure? }

      context "With a valid TIN" do
        let(:tin) { VALID_AT_TIN }
        it { should be true }
      end

      context "With an invalid TIN" do
        let(:tin) { INVALID_TIN }
        it { should be false }
      end
    end

    context "Specifying a country" do
      let(:country_code) { :at }
      subject { described_class.new(tin, country_code).valid_structure? }

      context "With a valid TIN" do
        let(:tin) { VALID_AT_TIN }
        it { should be true }
      end

      context "With an invalid TIN (for the specified country)" do
        let(:tin) { VALID_ES_TIN }
        it { should be false }
      end
    end
  end

  describe "#valid?" do
    context "Without specifying a country" do
      let(:tin) { VALID_AT_TIN }
      it { expect { described_class.new(tin).valid? }.to raise_error }
    end

    context "Specifying a country" do
      let(:country_code) { :es }
      subject { described_class.new(tin, country_code).valid? }

      context "With a valid TIN" do
        let(:tin) { VALID_ES_TIN }
        it { should be true }
      end

      context "With an invalid TIN" do
        let(:tin) { INVALID_TIN }
        it { should be false }
      end
    end
  end
end
