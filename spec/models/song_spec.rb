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

  describe 'track_number' do
    describe 'uniqueness' do
      let(:cd) { create(:cd) }
      let(:song) { build(:song, cd_id: cd.id, track_number: track_number) }

      subject do
        song.valid?
        song.errors
      end

      before { create(:song, cd_id: cd.id, track_number: 1) }
      context 'when track number is unique' do
        let(:track_number) { 2 }

        it { is_expected.not_to be_of_kind(:track_number, :taken) }
      end

      context 'when track number is not unique' do
        let(:track_number) { 1 }

        it { is_expected.to be_of_kind(:track_number, :taken) }
      end
    end
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
