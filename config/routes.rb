
Rails.application.routes.draw do
  
  
  get 'activities/index'
  get 'markets/index'
  get 'leadership/index'
  get 'sunday_school/index'
  get 'formation/index'
  get 'prayer/index'
   #mount Payola::Engine => '/payola', as: :payola
  get 'pages/home'
  root 'pages#home'
  get 'pages/albergue'
  get 'pages/directions'
  get 'visitors/index'
  #get 'products/:id', to: 'products#show', :as => :products
  #resources :pledges
  resources :worship, only: :index
  resources :tasks
  resources :opportunities
  resources :homilists
  resources :books
  resources :pledges
  resources :sermons
  devise_for :users
  resources :users 
  resources :profiles
  resources :posts do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
end
