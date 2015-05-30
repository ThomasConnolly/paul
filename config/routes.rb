
Rails.application.routes.draw do
  
  
  
  #mount Payola::Engine => '/payola', as: :payola
  get 'pages/home'
  get 'pages/dashboard'
  get 'visitors/index'
  #get 'products/:id', to: 'products#show', :as => :products
  #resources :pledges
  resources :tasks
  resources :opportunities
  resources :homilists
  resources :books
  resources :sermons
  resources :profiles
  devise_for :users
  resources :posts do
    resources :comments
  end
  
  
  mount Attachinary::Engine => '/attachinary'
  root to: 'pages#home'
end
