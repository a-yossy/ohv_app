# frozen_string_literal: true

require "rails_helper"

RSpec.describe TopPagesController, type: :request do
  describe "#show" do
    it do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
