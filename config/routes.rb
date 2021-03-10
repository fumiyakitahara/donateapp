Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: "supports#index"

  resources :supports, only:[:index,:new,:create,:show,:edit,:update] do
    resources :orders, only:[:index,:create]
    resources :comments, only:[:create, :destroy]
  end
end
