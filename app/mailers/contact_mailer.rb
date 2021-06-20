# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.confirm_inquiry.subject
  #
  def confirm_inquiry(contact)
    @contact = contact
    mail to: contact.email, subject: "【Outside Her Vision】お問い合わせありがとうございます"
  end

  def inquire_to_admin(contact)
    @contact = contact
    mail to: ENV["TOMAIL"], subject: "【Outside Her Vision】お問い合わせが届いています"
  end
end
