# frozen_string_literal: true

require "rails_helper"

RSpec.describe Information, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:announcement_date) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:priority) }
    it {
      should validate_numericality_of(:priority).
        only_integer.
        is_greater_than_or_equal_to(0)
    }
  end

  describe "recently_announced_at" do
    let!(:new_information) { create(:information, announcement_date: "2021-01-02") }
    let!(:old_information) { create(:information, announcement_date: "2021-01-01") }

    it do
      expect(described_class.recently_announced_at.to_a).to eq [new_information, old_information]
    end
  end

  describe "picture_size" do
    let(:information) { build(:information, picture: picture) }

    subject do
      information.valid?
      information.errors
    end

    context "with big picture" do
      let(:picture_path) { File.join(Rails.root, "spec/fixtures/size_test.jpg") }
      let(:picture) { Rack::Test::UploadedFile.new(picture_path) }

      it { is_expected.to be_of_kind(:picture, :should_be_smaller_than_5MB) }
    end

    context "with small picture" do
      let(:picture_path) { File.join(Rails.root, "spec/fixtures/test.jpg") }
      let(:picture) { Rack::Test::UploadedFile.new(picture_path) }

      it { is_expected.not_to be_of_kind(:information, :should_be_smaller_than_5MB) }
    end
  end
end
