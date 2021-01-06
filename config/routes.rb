Rails.application.routes.draw do
  root 'home#index'
  get 'home/download'
  match 'add', to: 'home#add', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
