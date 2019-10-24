# frozen_string_literal: true

Rails.application.routes.draw do
  # mount StripeEvent::Engine, at '/stripe/event'

  post '/stripe/event', to: 'webhooks#event'

  #resources :donations

  resource :stripe_plans, only: %i[new create]

  #resources :albergue_donations

  #resources :albergue_subscriptons

  resources :todo_list

  resources :formation_talks, only: %i[show index edit new]

  resources :marriage_talks, only: %i[new show index edit]

  resources :meditations

  resources :prayers

  resources :works

  root 'home#index'
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
  get 'pages/rector', as: 'rector'
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'pages/how_to_pray'
  get 'pages/haitian'
  get 'pages/history', as: :history
  get 'pages/profileSlides'
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
  get 'pages/ecumenical_concert'
  get 'pages/advent'
  get 'pages/jubilee'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
  get '/.well-known/apple-developer-merchantid-domain-association' => 'public/apple_pay_merchants#domain_association'

  # get ':id' => 'users#show', as: :user_profile
  # get ':id/setting' => 'users#edit', as: :user_setting
  # match ':id/setting' => 'profiles#update', via: [:put, :patch]

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

  devise_for :users
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'signout', to: 'devise/sessions#destroy', as: :logout
  end

  resource :pledge
  resources :pledges

  resources :ticket_charges, only: %i[new create]

  resources :pledge_charges, only: %i[new create]

  # resources :albergue_charges, only: %i[new create]

  resources :charges, only: %i[new create]

  resources :members

  resources :users do
    collection do
      post :import
    end
  end

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
  resources :jubilee_plans

  resources :jubilee_plans do
    resources :comments, module: :jubilee_plans
  end
  resources :candidates

  resources :candidates do
    resources :comments, module: :candidates
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

  devise_for :views

  # mount Attachinary::Engine => '/attachinary'
end
