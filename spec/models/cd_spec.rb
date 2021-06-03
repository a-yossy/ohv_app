require 'rails_helper'
RSpec.describe Cd, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:format) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:url) }
    it { should validate_length_of(:url).is_at_most(2000) }
  end
end
