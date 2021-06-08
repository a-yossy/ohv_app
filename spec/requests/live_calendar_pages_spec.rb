# frozen_string_literal: true

require "rails_helper"

RSpec.describe LiveCalendarPagesController, type: :request do
  describe "#show" do
    it do
      get live_calendar_page_path
      expect(response).to have_http_status(200)
    end
  end
end
