require "spec_helper"

describe Validatin::RemoteSyntaxCheck do
  context "Without specifying a country" do
    let(:tin) { VALID_AT_TIN }
    it { expect { described_class.new(tin) }.to raise_error }
  end

  context "Specifying a country" do
    subject { described_class.new(tin, country_code).valid_structure? }

    describe "#valid?" do
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
