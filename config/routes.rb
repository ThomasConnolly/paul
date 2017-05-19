Rails.application.routes.draw do
  
  resources :recipes
  resources :marriage_talks
  resources :meditations
  resources :prayers
  resources :works

  root 'home#index'
  get 'home/invitation'
  get 'members/index'
  get 'members/import'
  get 'thanks', to: 'tickets#thanks', as: 'thanks'
  get 'pledges/confirmation'
  resources :events do
    resources :tickets, only: [:new, :show, :create, :update, :index]
  end
  resources :members do
    collection do
      post :import
    end
  end
  resources :vestry_minutes
  resources :pictures
  resources :surveys, only: :index
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'pages/how_to_pray'
  get 'pages/haitian'
  get 'pages/tumaini'
  get 'pages/grace_works'
  get 'pages/albergue'
  get 'pages/calendar'
  get 'pages/directions'
  get 'comments/new'
  get 'pages/python_tutor'
  get 'pages/how_to_use'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

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
  resources :purchases, only: [:show]
  resources :formation_talks
  
  devise_for :users
    devise_scope :user do
      get 'register', to: 'devise/registrations#new', as: :register
      get 'login', to: 'devise/sessions#new', as: :login
      get 'signout', to: 'devise/sessions#destroy', as: :logout
    end
  resources :ticket_charges, only: [:new, :create]
  resources :charges, only: [:new, :create]
  resources :pledge_charges, only: [:new, :create]    
  resources :members
  
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
  resources :jubilee_plans
  resources :jubilee_plans do
    resources :comments, module: :jubilee_plans
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
  mount Ckeditor::Engine => '/ckeditor'
end
