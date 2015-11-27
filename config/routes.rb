Rails.application.routes.draw do
  devise_for :users
  get 'meats/weekview', controller: :meats, action: :weekview, as: :weekview

  resources :meats do

  end
  root to: 'meats#index'
  #get "meats/weekview" => "meats#weekview"
end
