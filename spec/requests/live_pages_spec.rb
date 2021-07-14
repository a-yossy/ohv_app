# frozen_string_literal: true

require "rails_helper"

RSpec.describe LivePagesController, type: :request do
  describe "#index" do
    it do
      get live_pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get new_live_page_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get new_live_page_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#create" do
    subject {
      post live_pages_path,
           params: { live: { place: "place", title: "title", detail: "detail", open_hour: "2021/01/01 00:00", start_hour: "2021/01/01 00:30",
                             advance_ticket_price: 2000, doors_ticket_price: 2500, start_time: "2021/01/01" } }
    }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        expect { subject }.to change(Live, :count).by(1)
        expect(response).to redirect_to live_pages_path
        expect(flash[:success]).to eq I18n.t "live_pages.create.success"
      end
    end

    context "when user does not log in" do
      it do
        expect { subject }.to change(Live, :count).by(0)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe "#edit" do
    let(:live) { create(:live) }

    context "when user logs in" do
      let(:admin) { create(:admin) }
      before { login_as(admin) }

      it do
        get edit_live_page_path(live)
        expect(response).to have_http_status(200)
      end
    end

    context "when user does not log in" do
      it do
        get edit_live_page_path(live)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
