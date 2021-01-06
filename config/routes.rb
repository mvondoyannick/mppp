Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/download'
  match 'command', to: 'home#command', via: [:post, :get]
  match 'add', to: 'home#add', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
