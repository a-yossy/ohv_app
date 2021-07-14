# frozen_string_literal: true

require "rails_helper"

RSpec.describe VideoFormObject, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:video_model) }
    it { should validate_presence_of(:url) }
  end

  describe "#execute" do
    let(:video_form_object) { described_class.new(video_model: video_model, url: params_url) }
    let(:video_model) { build(:video, url: params_url) }
    let(:params_url) { "https://www.youtube.com/watch?v=j9q4EO7_6-Q" }

    subject { video_form_object.execute }

    context "when video_form_object is valid" do
      before { allow(video_form_object).to receive(:valid?).and_return(true) }

      it do
        expect { subject }.to change(Video, :count).by(1)
        expect(video_model.url).to eq "https://www.youtube.com/embed/j9q4EO7_6-Q"
        is_expected.to eq true
      end
    end

    context "when video_form_object is not valid" do
      before { allow(video_form_object).to receive(:valid?).and_return(false) }

      it do
        expect { subject }.to change(Video, :count).by(0)
        is_expected.to eq false
      end
    end
  end
end
