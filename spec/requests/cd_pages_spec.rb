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

  describe "#new" do
    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get new_cd_page_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get new_cd_page_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#create" do
    let(:picture_path) { File.join(Rails.root, "spec/fixtures/test.jpg") }
    let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
    subject {
      post cd_pages_path,
           params: { cd_form_object: { format: "format", picture: picture, title: "title", release_date: "2021-01-01", price: 1000, url: "https://linkco.re/r1zyVcrS",
                                       songs: [name_1: "name_1", track_number_1: 1, name_2: "name_2", track_number_2: 2], form_count: 2 } }
    }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Cd, :count).by(1)
        pending
        expect { subject }.to change(Song, :count).by(2)
        expect(response).to redirect_to cd_pages_path
        expect(flash[:success]).to eq I18n.t "cd_pages.create.success"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Cd, :count).by(0)
        expect { subject }.to change(Song, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#edit" do
    let(:cd) { create(:cd) }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get edit_cd_page_path(cd)
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get edit_cd_page_path(cd)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
