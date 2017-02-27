Rails.application.routes.draw do
  # root => 'offers#index'
  resources :offers
  devise_for :buyers
  devise_for :sellers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
