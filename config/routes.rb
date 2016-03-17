Rails.application.routes.draw do
  

  root 'pages#home'
  devise_for :views

  get 'members/index'
  get 'members/import'
  resources :members do
    collection do
      post :import
    end
  end

  resources :contacts
  resources :widgets
  resources :pictures
  resources :albums
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'formation/index'
  get 'prayer/index'
  # mount Payola::Engine => '/payola', as: :payola
  get 'home', to: 'pages#home'
  get 'haitian', to: 'pages#haitian'
  get 'concert', to: 'pages#concert'
  get 'albergue', to: 'pages#albergue'
  get 'calendar', to: 'pages#calendar'
  get 'directions', to: 'pages#directions'
  get 'comments/new'
  get 'ruby_tutor', to: 'pages#python_tutor'
    # get ':id' => 'users#show', as: :user_profile
  # get ':id/setting' => 'users#edit', as: :user_setting
  # match ':id/setting' => 'profiles#update', via: [:put, :patch]
  # resources :pledges
  
  resources :worship, only: :index
  resources :tasks
  resources :opportunities
  resources :homilists
  resources :books
  resource :pledge
  resources :sermons
  devise_for :users
    devise_scope :user do
      get 'register', to: 'devise/registrations#new', as: :register
      get 'login', to: 'devise/sessions#new', as: :login
      get 'signout', to: 'devise/sessions#destroy', as: :logout
    end
  resources :users do
    collection do
      post :import
    end
  end
  resources :profiles
  resources :posts do
    resources :comments, module: :posts
  end
  resources :vreports do
    resources :comments, module: :vreports
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "letter_opener"
  end

  
  mount Attachinary::Engine => '/attachinary'
end
