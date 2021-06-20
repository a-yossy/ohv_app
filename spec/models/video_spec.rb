require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:release_date) }
    it { should validate_length_of(:url).is_at_most(2000) }
  end

  describe "recently_released_at" do
    let!(:new_video) { create(:video, release_date: "2021-01-02") }
    let!(:old_video) { create(:video, release_date: "2021-01-01") }

    it do
      expect(described_class.recently_released_at.to_a).to eq [new_video, old_video]
    end
  end
end
