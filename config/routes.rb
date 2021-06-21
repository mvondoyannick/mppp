Rails.application.routes.draw do
  resources :meetings
  resources :podcasts
  resources :codes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # devise_for :users
  match 'index', to: 'home#index', via: [:post, :get]
  get 'home/download'
  get 'home/calendar'
  match 'command', to: 'home#command', via: [:post, :get]
  get 'home/list'
  get 'home/download_detail'
  root 'home#identify'
  match 'add', to: 'home#add', via: [:get, :post]

  # only for connected admin
  scope :admin do
    get 'dashboard', to: 'home#admin'
    get 'admin_codes', to: 'codes#index'
    match 'mailman', to: 'home#mailman', via: [:get, :post]
    match 'new_codes', to: 'codes#generate', via: [:post, :get]
    get 'share', to: 'codes#share'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
