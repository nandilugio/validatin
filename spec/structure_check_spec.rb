require "spec_helper"

describe Validatin::StructureCheck do
  describe "#valid?" do
    context "Without specifying a country" do
      subject { described_class.new(tin).valid? }

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
      subject { described_class.new(tin, country_code).valid? }

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
end
