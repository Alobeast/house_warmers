Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:delete, :index, :show] do
    resources :flats, only: [:edit, :update]
  end
  resources :flats, except: [:edit, :update] do
    resources :reviews, only: [:index]
  end
  resources :viewings, only: [:index, :new, :create]
  resources :reviews, only: [:new, :create]
end
