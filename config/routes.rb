Rails.application.routes.draw do

  namespace :admin do
  get 'opportunities/index'
  end

  namespace :admin do
  get 'opportunities/show'
  end

  namespace :admin do
  get 'opportunities/new'
  end

  namespace :admin do
  get 'opportunities/edit'
  end

  namespace :admin do
  get 'opportunities/update'
  end

  namespace :admin do
  get 'opportunities/destroy'
  end

  namespace :admin do
  get 'sessions/new'
  end

  namespace :admin do
  get 'sessions/create'
  end

  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
  get 'users/show'
  end

  namespace :admin do
  get 'users/new'
  end

  namespace :admin do
  get 'users/create'
  end

  namespace :admin do
  get 'users/destroy'
  end

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/index'

  get 'users/destroy'

  namespace :admin do
  get 'sermons/new'
  end

  namespace :admin do
  get 'sermons/edit'
  end

  namespace :admin do
  get 'sermons/show'
  end

  namespace :admin do
  get 'sermons/destroy'
  end

  namespace :admin do
  get 'sermons/create'
  end

  namespace :admin do
  get 'sermons/index'
  end

  namespace :admin do
  get 'homilists/new'
  end

  namespace :admin do
  get 'homilists/edit'
  end

  namespace :admin do
  get 'homilists/show'
  end

  namespace :admin do
  get 'homilists/destroy'
  end

  namespace :admin do
  get 'homilists/create'
  end

  namespace :admin do
  get 'homilists/index'
  end

  namespace :admin do
  get 'posts/new'
  end

  namespace :admin do
  get 'posts/create'
  end

  namespace :admin do
  get 'posts/edit'
  end

  namespace :admin do
  get 'posts/update'
  end

  namespace :admin do
  get 'posts/destroy'
  end

  namespace :admin do
  get 'posts/index'
  end

  namespace :admin do
  get 'posts/show'
  end

  resources :opportunities

  get 'static_pages/home'
  get 'static_pages/help'
  
  resources :books, only: [:index, :show]
  resources :sermons, only: [:index, :show]
  resources :profiles
  devise_for :users
  resources :posts do
    resources :comments
  end

  namespace :admin do
    resources :homilists, :books, :comments, :opportunities, :profiles, :sermons, :users
  end
  
  root to: 'posts#index'

end
