require 'rails_helper'

RSpec.describe Cd, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:url) }
    it { should validate_length_of(:url).is_at_most(2000) }
  end

  describe 'format' do
    let(:cd) { build(:cd, format: format) }

    subject do
      cd.valid?
      cd.errors
    end

    context 'with blank format' do
      let(:format) { '' }

      it { is_expected.to be_of_kind(:format, :blank) }
    end

    context 'with not blank format' do
      let(:format) { 'format' }

      it { is_expected.not_to be_of_kind(:format, :blank) }
    end
  end


  describe 'associations' do
    it { should have_many(:songs) }
  end

  describe "recently_released_at" do
    let!(:new_cd) { create(:cd, release_date: "2021-01-02") }
    let!(:old_cd) { create(:cd, release_date: "2021-01-01") }

    it do
      expect(described_class.recently_released_at.to_a).to eq [new_cd, old_cd]
    end
  end
end
