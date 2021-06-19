# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true

  def send_contact_email
    ContactMailer.confirm_inquiry(self).deliver_now
    ContactMailer.inquire_to_admin(self).deliver_now
  end
end
