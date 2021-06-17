# frozen_string_literal: true

RSpec.describe Contact, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:email).is_at_most(255) }
  end

  describe "email" do
    let(:contact) { build(:contact, email: email) }

    subject do
      contact.valid?
      contact.errors
    end

    context "with invalid email" do
      let(:email) { "email_example.com" }

      it { is_expected.to be_of_kind(:email, :invalid) }
    end

    context "with valid email" do
      let(:email) { "email@example.com" }

      it { is_expected.not_to be_of_kind(:email, :invalid) }
    end
  end
end
