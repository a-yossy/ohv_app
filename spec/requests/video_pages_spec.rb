# frozen_string_literal: true

require "rails_helper"

RSpec.describe VideoPagesController, type: :request do
  describe "#index" do
    it do
      get video_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get new_video_page_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get new_video_page_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#create" do
    subject {
      post video_pages_path, params: { video: { title: "title", url: "https://www.google.co.jp/?client=safari&channel=mac_bm", release_date: "2021-01-01" } }
    }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Video, :count).by(1)
        expect(response).to redirect_to video_pages_path
        expect(flash[:success]).to eq I18n.t "video_pages.create.success"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Video, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#edit" do
    let(:video) { create(:video) }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get edit_video_page_path(video)
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get edit_video_page_path(video)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#update" do
    let(:video) { create(:video, url: "https://www.google.co.jp/?client=safari&channel=mac_bm") }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        put video_page_path(video), params: { video: { url: "https://www.yahoo.co.jp" } }
        expect(video.reload.url).to eq "https://www.yahoo.co.jp"
        expect(request).to redirect_to video_pages_path
        expect(flash[:success]).to eq I18n.t "video_pages.update.success"
      end
    end

    context "when user does not log in" do
      it do
        put video_page_path(video), params: { video: { url: "https://www.yahoo.co.jp" } }
        expect(video.reload.url).not_to eq "https://www.yahoo.co.jp"
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#destroy" do
    let!(:video) { create(:video) }
    subject { delete video_page_path video }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Video, :count).by(-1)
        expect(response).to redirect_to video_pages_path
        expect(flash[:success]).to eq I18n.t "video_pages.destroy.success"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Video, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
