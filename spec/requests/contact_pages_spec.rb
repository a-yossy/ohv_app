# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContactPagesController, type: :request do
  describe "#new" do
    it do
      get new_contact_page_path
      expect(response).to have_http_status(200)
    end
  end
end
