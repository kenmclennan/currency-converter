Rails.application.routes.draw do

  namespace :api do
    resources :currency_conversion, only: :index
    resources :currencies, only: :index
    resources :date_range, only: :index
  end

  mount_ember_app :frontend, to: "/"
end
