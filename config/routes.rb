Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:delete, :index, :show] do
    resources :flats, only: [:edit, :update]
  end
  resources :flats, except: [:edit, :update] do

  end
  resources :viewings, only: [:index, :new, :create]

  resources :reviews, only: [:new, :create, :index]




  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
