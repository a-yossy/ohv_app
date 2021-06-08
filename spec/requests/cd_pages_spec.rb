# frozen_string_literal: true

require "rails_helper"

RSpec.describe CdsPagesController, type: :request do
  describe "#index" do
    it do
      get cds_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:cd) { create(:cd, picture: "1st demo.jpg") }

    it do
      get cds_page_path(cd)
      expect(response).to have_http_status(200)
    end
  end
end
