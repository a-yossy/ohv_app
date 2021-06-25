# frozen_string_literal: true

require "rails_helper"

RSpec.describe LiveDateViewObject, type: :model do
  describe "live_dates" do
    before do
      create(:live, start_time: "2021/01/01")
      create(:live, start_time: "2021/02/01")
      create(:live, start_time: "2021/02/02")
    end

    subject { described_class.live_dates }

    it {
      is_expected.to eq [["all_live", -Float::INFINITY..Float::INFINITY], ["2021-02", Date.new(2021, 2, 1).in_time_zone.all_month],
                         ["2021-01", Date.new(2021, 1, 1).in_time_zone.all_month]].to_set
    }
  end
end
