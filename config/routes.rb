# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top_pages#show"
  resource :bio_page, only: %i[show]
  resources :video_pages, only: %i[new show create edit update]
  resource :live_calendar_page, only: %i[show]
  resource :live_page, only: %i[show]
  resource :contact_page, only: %i[new create]
  resources :cd_pages, only: %i[index show]
  resources :news_pages
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end
