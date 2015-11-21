Rails.application.routes.draw do
  
  resources :pictures
  resources :albums
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'formation/index'
  get 'prayer/index'
  # mount Payola::Engine => '/payola', as: :payola
  get 'pages/home'
  root 'pages#home'
  get 'pages/albergue'
  get 'pages/directions'
  get 'pages/map'
  get 'visitors/index'
  resources :homestest, only: [:show]
  get 'homestest/show'
  get 'comments/new'
    # get ':id' => 'users#show', as: :user_profile
  # get ':id/setting' => 'users#edit', as: :user_setting
  # match ':id/setting' => 'profiles#update', via: [:put, :patch]
  # resources :pledges
  
  resources :worship, only: :index
  resources :tasks
  resources :opportunities
  resources :homilists
  resources :books
  resources :pledges
  resources :sermons
  devise_for :users  #, :controllers => { registrations: 'registrations' }
    devise_scope :user do
      get 'register', to: 'devise/registrations#new', as: :register
      get 'login', to: 'devise/sessions#new', as: :login
      get 'signout', to: 'devise/sessions#destroy', as: :logout
    end
  resources :users, only: [:index, :show, :edit, :update]
  resources :profiles
  resources :posts do
<<<<<<< HEAD
    resources :comments
=======
    resources :comments, module: :posts
  end
  resources :vreports, only: [:index] do
    resources :comments, module: :vreports
>>>>>>> stripe
  end
 

  mount Attachinary::Engine => '/attachinary'
end
