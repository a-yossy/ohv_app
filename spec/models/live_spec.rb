# frozen_string_literal: true

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
end
