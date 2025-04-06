# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :agendas do
    resources :agenda_items do
      collection do
        post :sort
      end
    end
  end

  post '/webhooks', to: 'webhooks#create'

  resources :stripe_reports, only: %i[index show]
  resources :tickets, only: :index

  resources :events do
    resources :tickets, only: :index
  end

  resources :pledges
  scope 'checkout_pledges' do
    post 'create', to: 'checkout_pledges#create', as: 'checkout_pledge'
    get 'success', to: 'checkout_pledges#success', as: 'checkout_pledges_success'
  end

  resources :links
  resources :pathways
  resources :pray_fors
  resources :photos

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :members do
    collection do
      post :import
    end
  end
  resources :vestry_minutes
  resources :surveys, only: :index

  get 'members/import'
  get 'series/index'
  get 'pages/roberts_rules'
  get 'pages/way_of_love'
  get 'pages/sacred_ground'
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'pages/how_to_pray'
  get 'pages/annual_report'
  get 'pages/haitian'
  get 'pages/history', as: :history
  get 'pages/tumaini'
  get 'pages/bulletin'
  get 'pages/calendar'
  get 'pages/directions'
  get 'pages/how_to_use'
  get 'pages/stay_safe'
  get 'pages/music'
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
  get '/.well-known/apple-developer-merchantid-domain-association' =>
    'public/apple_pay_merchants#domain_association'

  resources :worship, only: :index
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
  resources :profiles
  resources :posts do
    resources :comments, only: %i[create edit]
  end
  resources :vnotes do
    resources :comments, only: %i[create edit]
  end

  resources :story_ideas do
    resources  :comments, only: %i[create edit]
  end

  resources :tasks
  resources :todos

  resources :anniversaries do
    collection do
      post :import
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  mount ActionCable.server => '/cable'

  # mount MissionControl::Jobs::Engine => '/jobs'
end
