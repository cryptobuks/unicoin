Rails.application.routes.draw do

  root 'main#index'
  get 'main' => 'main#index'
  resources :offers
  devise_for :buyers
  devise_for :sellers

  match 'buyers/:id' => 'buyers#show', via: :get
  match 'sellers/:id' => 'sellers#show', via: :get

  # root 'offers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
