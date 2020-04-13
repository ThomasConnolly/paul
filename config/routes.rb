# frozen_string_literal: true
Rails.application.routes.draw do

  resources :pathways
  resources :pray_fors
  resources :photos
  devise_for :users, 
    path: '',
    path_names: {
      sign_in: 'sign_in',
      sign_out: 'logout',
      password: 'secret',
      registration: 'register',
      sign_up: 'signup'
    }  
  root to: 'home#index' 
  resources :users do
    collection do
      post :import
    end
  end

  resource :stripe_plans, only: %i[new create]
  # mount StripeEvent::Engine, at '/stripe/event'
  post '/stripe/event', to: 'webhooks#event'
  resources :todo_list
  resources :formation_talks, only: %i[show index edit new]
  resources :marriage_talks, only: %i[new show index edit]
  get 'home/invitation'
  get 'members/index'
  get 'members/import'
  resources :events do
    resources :tickets, only: %i[new show create update index]
  end
  resources :members do
    collection do
      post :import
    end
  end
  resources :vestry_minutes
  resources :pictures
  resources :surveys, only: :index
  
  get 'series/index'
  get 'pages/way_of_love'
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'pages/how_to_pray'
  get 'pages/annual_report'
  get 'pages/haitian'
  get 'pages/history', as: :history
  get 'pages/tumaini'
  get 'pages/albergue'
  get 'pages/calendar'
  get 'pages/directions'
  get 'pages/parish_profile'
  get 'comments/new'
  get 'pages/python_tutor'
  get 'pages/how_to_use'
  get 'pages/stay_safe'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
  get '/.well-known/apple-developer-merchantid-domain-association' => 'public/apple_pay_merchants#domain_association'

  resources :worship, only: :index
  resources :tasks
  resources :opportunities
  resources :homilists
  resources :books
  get 'books_admin', controller: :books
  get 'books_author', controller: :books
  get 'books_title', controller: :books
  resources :books do
    collection do
      post :import
    end
  end
  resources :sermons
  resources :purchases, only: [:show]
  resources :formation_talks
  resource :pledge
  resources :pledges
  resources :ticket_charges, only: %i[new create]
  resources :pledge_charges, only: %i[new create]
  resources :charges, only: %i[new create]
  resources :comments
  resources :profiles
  resources :posts do
    resources :comments, module: :posts
  end
  resources :vreports do
    resources :comments, module: :vreports
  end
  resources :story_ideas do
    resources :comments, module: :story_ideas
  end
  resources :syllabuses do
    collection do
      get 'preschool'
      get 'primary'
      get 'intermediate'
    end
  end
  resources :syllabuses do
    collection { post :import }
  end
  resources :anniversaries do
    collection do
      post :import
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
