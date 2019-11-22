Rails.application.routes.draw do
  resources :documents, only: %i(show) do
    resource :thumbnail, only: %i(show), module: :documents
  end
  resources :applications, only: %i(index show)
  root to: "applications#index"
end
