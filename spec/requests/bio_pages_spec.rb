require 'rails_helper'

RSpec.describe BioPagesController, type: :request do
  describe "#show" do
    it do
      get bio_page_path
      expect(response).to have_http_status(200)
    end
  end
end
