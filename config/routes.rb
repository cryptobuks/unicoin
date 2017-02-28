Rails.application.routes.draw do

  root 'main#index'
  get 'main' => 'main#index'
  resources :offers
  devise_for :buyers
  devise_for :sellers

  # root 'offers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
