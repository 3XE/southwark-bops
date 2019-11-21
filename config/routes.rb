Rails.application.routes.draw do
  resources :documents, only: %i(show)
  resources :applications, only: %i(index show)
  root to: "applications#index"
end
