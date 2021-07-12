# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContactPagesController, type: :request do
  describe "#new" do
    it do
      get new_contact_page_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    subject { post contact_page_path, params: { contact: { name: "name", email: "example@email.com", content: "content" } } }

    it do
      expect { subject }.to change(Contact, :count).by(1)
      expect(response).to redirect_to root_path
      expect(flash[:info]).to eq I18n.t "contact_pages.create.info"
    end
  end
end
