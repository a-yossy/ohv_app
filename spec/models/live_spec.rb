# frozen_string_literal: true

require "rails_helper"

RSpec.describe Live, type: :model do
  describe "validations" do
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:detail) }
    it { should validate_presence_of(:open_hour) }
    it { should validate_presence_of(:start_hour) }
    it { should validate_presence_of(:advance_ticket_price) }
    it { should validate_presence_of(:doors_ticket_price) }
    it { should validate_presence_of(:start_time) }
    it {
      should validate_numericality_of(:advance_ticket_price).
        only_integer.
        is_greater_than_or_equal_to(0)
    }
    it {
      should validate_numericality_of(:doors_ticket_price).
        only_integer.
        is_greater_than_or_equal_to(0)
    }
  end

  describe "open hour should be earlier than start hour" do
    let(:live) { build(:live, open_hour: "2021/01/01 18:00", start_hour: start_hour) }

    subject do
      live.valid?
      live.errors
    end

    context "when open hour is earlier than start hour" do
      let(:start_hour) { "2021/01/01 18:30" }

      it { is_expected.not_to be_of_kind(:start_hour, :should_be_earlier_than_open_hour) }
    end

    context "when open hour is not earlier than start hour" do
      let(:start_hour) { "2021/01/01 17:30" }

      it { is_expected.to be_of_kind(:start_hour, :should_be_earlier_than_open_hour) }
    end
  end

  describe "recently_held_live" do
    let!(:new_live) { create(:live, start_time: "2021/01/02") }
    let!(:old_live) { create(:live, start_time: "2021/01/01") }

    it do
      expect(described_class.recently_held_live.to_a).to eq [new_live, old_live]
    end
  end
end
