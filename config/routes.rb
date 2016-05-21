Rails.application.routes.draw do
  

  root 'home#index'
  
  get 'members/index'
  get 'members/import'
  resources :members do
    collection do
      post :import
    end
  end

  resources :contacts
  resources :pictures
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'formation/index'
  get 'prayer/index'
  get 'pages/haitian'
  get 'pages/concert'
  get 'pages/albergue'
  get 'pages/calendar'
  get 'pages/directions'
  get 'comments/new'
  get 'pages/python_tutor'
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
  resources :posts
  resources :posts do
    resources :comments, module: :posts
  end
  resources :vreports
  resources :vreports do
    resources :comments, module: :vreports
  end
  resources :story_ideas
  resources :story_ideas do
    resources :comments, module: :story_ideas
  end

  resources :comments, only: [:destroy]

    resources :syllabuses do
    collection do
      get "preschool"
      get "primary"
      get "intermediate"
    end
  end

  resources :syllabuses do
    collection { post :import }
  end

  resources :anniversaries
  resources :anniversaries do
    collection do
      post :import
    end
  end
  

  devise_for :views
  mount Attachinary::Engine => '/attachinary'
end
