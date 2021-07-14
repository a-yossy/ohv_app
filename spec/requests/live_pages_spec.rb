# frozen_string_literal: true

require "rails_helper"

RSpec.describe LivePagesController, type: :request do
  describe "#index" do
    it do
      get live_pages_path
      expect(response).to have_http_status(200)
    end
  end
end
