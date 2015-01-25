Rails.application.routes.draw do

  
  resources :opportunities
  resources :homilists
  resources :books
  resources :sermons
  resources :profiles
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :albums
  resources :photos
  
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'sermons#index'
end
