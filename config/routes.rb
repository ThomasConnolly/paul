# frozen_string_literal: true

Rails.application.routes.draw do


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
    
  resources :users

  resources :users do
    collection do
      post :import
    end
  end

  resource :stripe_plans, only: %i[new create]
  # mount StripeEvent::Engine, at '/stripe/event'

  post '/stripe/event', to: 'webhooks#event'

  #resources :donations
  #resources :albergue_donations

  #resources :albergue_subscriptons

  resources :todo_list

  resources :formation_talks, only: %i[show index edit new]

  resources :marriage_talks, only: %i[new show index edit]

  resources :meditations

  resources :prayers

  resources :works

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
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'pages/how_to_pray'
  get 'pages/haitian'
  get 'pages/history', as: :history
  get 'pages/tumaini'
  get 'pages/trivia'
  get 'pages/grace_works'
  get 'pages/albergue'
  get 'pages/calendar'
  get 'pages/directions'
  get 'pages/parish_profile'
  get 'comments/new'
  get 'pages/long_range'
  get 'pages/python_tutor'
  get 'pages/how_to_use'
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

  resources :letters

  resources :letters do
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

  # resources :albergue_charges, only: %i[new create]

  resources :charges, only: %i[new create]


  resources :comments

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

  resources :anniversaries

  resources :anniversaries do
    collection do
      post :import
    end
  end



  # mount Attachinary::Engine => '/attachinary'
end
