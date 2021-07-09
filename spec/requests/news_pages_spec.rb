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
      before { login_as(admin) }

      it do
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

  describe "#create" do
    let(:picture_path) { File.join(Rails.root, "spec/fixtures/test.jpg") }
    let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
    subject {
      post news_pages_path, params: { information: { title: "title", picture: picture, announcement_date: "2021-01-01", content: "content", priority: 0 } }
    }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Information, :count).by(1)
        expect(response).to redirect_to news_page_path(Information.first)
        expect(flash[:success]).to eq "作成しました"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Information, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#edit" do
    let(:information) { create(:information) }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
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

  describe "#update" do
    let(:picture_path) { File.join(Rails.root, "spec/fixtures/test.jpg") }
    let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
    let(:information) { create(:information, title: "old_title") }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        put news_page_path(information),
            params: { information: { title: "new_title", picture: picture, announcement_date: "2021-01-01", content: "content", priority: 0 } }
        expect(information.reload.title).to eq "new_title"
        expect(request).to redirect_to news_page_path(information)
        expect(flash[:success]).to eq "更新しました"
      end
    end

    context "when user does not log in" do
      it do
        put news_page_path(information),
            params: { information: { title: "new_title", picture: picture, announcement_date: "2021-01-01", content: "content", priority: 0 } }
        expect(information.reload.title).not_to eq "new_title"
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#destroy" do
    let!(:information) { create(:information) }
    subject { delete news_page_path information }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Information, :count).by(-1)
        expect(response).to redirect_to news_pages_path
        expect(flash[:success]).to eq "削除しました"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Information, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
