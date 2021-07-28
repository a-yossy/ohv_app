# frozen_string_literal: true

require "rails_helper"

RSpec.describe CdFormObject, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:form_count) }
  end

  describe "#execute" do
    let(:picture_path) { File.join(Rails.root, "spec/fixtures/test.jpg") }
    let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
    let(:cd_form_object) {
      described_class.new(format: "format", picture: picture, title: "title", release_date: "2021-01-01", price: 1000, url: "https://linkco.re/r1zyVcrS",
                          songs: [song1, song2], form_count: 2)
    }
    let(:song1) { build(:song) }
    let(:song2) { build(:song) }

    subject { cd_form_object.execute }

    context "when cd_form_object is valid" do
      before { allow(cd_form_object).to receive(:valid?).and_return(true) }

      it do
        expect { subject }.to change(Cd, :count).by(1)
        expect { subject }.to change(Song, :count).by(2)
        is_expected.to eq true
      end
    end

    context "when cd_form_object is not valid" do
      before { allow(cd_form_object).to receive(:valid?).and_return(false) }

      it do
        expect { subject }.to change(Cd, :count).by(0)
        expect { subject }.to change(Song, :count).by(0)
        is_expected.to eq false
      end
    end
  end
end
