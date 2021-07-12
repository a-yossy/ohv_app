# frozen_string_literal: true

class ContactPagesController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      @contact.send_contact_email
      flash[:info] = t '.info'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
