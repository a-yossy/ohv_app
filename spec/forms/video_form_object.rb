# frozen_string_literal: true

require "rails_helper"

RSpec.describe VideoFormObject, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:video_model) }
    it { should validate_presence_of(:url) }
  end

  describe '#execute' do
    let(:video_form_object) { described_class.new(video_model: video_model, url: url) }
    let(:video_model) { build(:video) }
    let(:url) { 'https://www.youtube.com/watch?v=j9q4EO7_6-Q' }

    subject { video_form_object.execute }

    context 'when video_form_object is valid' do
      before { allow(video_form_object).to receive(:valid?).and_return(true) }

      it do
        expect { subject }.to change(Video, :count).by(1)
        is_expected.to eq true
      end
    end

    context 'when video_form_object is not valid' do
    end
  end
end
