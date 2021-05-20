Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top_pages#show'
  resource :bio_page, only: %i[show]
  resource :video_page, only: %i[show]
end
