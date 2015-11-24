Rails.application.routes.draw do
 resources :meats
  root to: 'meats#index'
end
