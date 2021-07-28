# frozen_string_literal: true

require "rails_helper"

RSpec.describe CdPagesController, type: :request do
  describe "#index" do
    it do
      get cd_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:cd) { create(:cd) }

    it do
      get cd_page_path(cd)
      expect(response).to have_http_status(200)
    end
  end
end
