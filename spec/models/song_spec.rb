require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:track_number) }
    it { should validate_presence_of(:cd_id) }
    it { should validate_numericality_of(:track_number).
                only_integer.
                is_greater_than_or_equal_to(1)  }
  end

  describe 'recording_order' do
    let!(:cd) { create(:cd) }
    let!(:first_track_number_song) { create(:song, cd_id: cd.id, track_number: 1) }
    let!(:second_track_number_song) { create(:song, cd_id: cd.id, track_number: 2) }

    it do
      expect(described_class.recording_order.to_a).to eq [first_track_number_song, second_track_number_song]
    end
  end
end
