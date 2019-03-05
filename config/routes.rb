Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'flats/new'
  get 'flats/create'
  get 'flats/edit'
  get 'flats/update'
  get 'flats/index'
  get 'flats/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:delete, :index, :show] do
    resources :flats, only: [:edit, :update]
  end
  resources :flats, except: [:edit, :update]

end
