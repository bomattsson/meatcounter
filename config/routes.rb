Rails.application.routes.draw do
  devise_for :users
  resources :meats
  root to: 'meats#index'
end
