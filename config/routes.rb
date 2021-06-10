# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top_pages#show"
  resource :bio_page, only: %i[show]
  resource :video_page, only: %i[show]
  resource :live_calendar_page, only: %i[show]
  resource :contact_page, only: %i[new create]
  resources :cd_pages, only: %i[index show]
  resources :news_pages, only: %i[index show]
end
