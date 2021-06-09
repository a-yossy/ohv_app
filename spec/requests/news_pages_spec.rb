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
    let!(:information) { create(:information, picture: "1st demo.jpg") }

    it do
      get news_page_path(information)
      expect(response).to have_http_status(200)
    end
  end
end
