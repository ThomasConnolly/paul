# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end
  namespace :todo_list do
    resources :todo_items
  end
  root to: 'home#index'

  resources :shots
  resources :surveys
  resources :thankfuls

  post '/webhook_events/:source', to: 'webhook_events#create'

  get 'checkout', to: 'checkout#show'
  post 'create', to: 'checkout#create', as: 'checkout/create'
  get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  get 'success', to: 'checkout#success', as: 'checkout_success'

  resources :donations

  resources :pledges

  post 'create', to: 'payment#create', as: 'payment_create'
  get 'cancel', to: 'payment#cancel', as: 'payment_cancel'
  get 'success', to: 'payment#success', as: 'payment_success'

  scope '/checkout_tickets' do
    post 'create', to: 'checkout_tickets#create', as: 'checkout_tickets_create'
    get 'cancel', to: 'checkout_tickets#cancel', as: 'cancel'
    get 'success', to: 'checkout_tickets#success', as: 'checkout_tickets_success'
  end
  resources :vaccinations, only: %i[new create index]

  resources :events do
    resources :tickets, only: %i[new show create update]
  end

  resources :tickets, only: %(index)
  resources :albergue_children
  resources :links
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

  resources :users do
    collection do
      post :import
    end
  end

  resources :formation_talks, only: %i[show index edit new]
  resources :marriage_talks, only: %i[new show index edit]

  resources :members do
    collection do
      post :import
    end
  end
  resources :vestry_minutes
  resources :surveys, only: :index

  get 'members/import'
  get 'series/index'
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

  resources :stripe_reports, only: %i[index show]
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
  resources :formation_talks
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
  resources :tasks
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

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
