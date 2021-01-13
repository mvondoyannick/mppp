Rails.application.routes.draw do
  resources :codes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # devise_for :users
  match 'index', to: 'home#index', via: [:post, :get]
  get 'home/download'
  match 'command', to: 'home#command', via: [:post, :get]
  get 'home/list'
  get 'home/download_detail'
  root 'home#identify'
  match 'add', to: 'home#add', via: [:get, :post]

  # only for connected admin
  scope :admin do
    get 'dashboard', to: 'home#admin'
    match 'mailman', to: 'home#mailman', via: [:get, :post]
    match 'new_codes', to: 'codes#generate', via: [:post, :get]
    get 'share', to: 'codes#share'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
