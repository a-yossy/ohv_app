# frozen_string_literal: true

require "rails_helper"

RSpec.describe NewsPagesController, type: :request do
  describe "#index" do
    it do
      get news_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let!(:information) { create(:information) }

    it do
      get news_page_path(information)
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    context "when user logs in" do
      let(:admin) { create(:admin) }

      it do
        login_as(admin)
        get new_news_page_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get new_news_page_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#edit" do
    let(:information) { create(:information) }

    context "when user logs in" do
      let(:admin) { create(:admin) }

      it do
        login_as(admin)
        get edit_news_page_path(information)
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get edit_news_page_path(information)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
