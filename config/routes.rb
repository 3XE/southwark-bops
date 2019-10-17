Rails.application.routes.draw do
  resources :applications, only: %i(index show)
  root to: "applications#index"
end
