# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  # Preview this email at
  # http://localhost:3000/rails/mailers/contact_mailer/confirm_inquiry
  def confirm_inquiry
    contact = Contact.new(name: "name",
                          email: "email@example.com",
                          content: "content")
    ContactMailer.confirm_inquiry(contact)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/contact_mailer/inquire_to_admin
  def inquire_to_admin
    contact = Contact.new(name: "name",
                          email: "email@example.com",
                          content: "content")
    ContactMailer.inquire_to_admin(contact)
  end
end
