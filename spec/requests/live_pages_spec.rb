# frozen_string_literal: true

require "rails_helper"

RSpec.describe LivePagesController, type: :request do
  describe "#index" do
    it do
      get live_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get new_live_page_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get new_live_page_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
