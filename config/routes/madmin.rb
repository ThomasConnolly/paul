# frozen_string_literal: true

# Below are the routes for madmin
namespace :madmin do
  namespace :action_text do
    resources :encrypted_rich_texts
  end
  resources :pledges
  resources :posts
  namespace :action_text do
    resources :rich_texts
  end
  resources :story_ideas
  resources :syllabuses
  resources :profiles
  resources :webhook_events
  resources :thankfuls
  resources :tickets
  resources :pathways
  resources :formation_talks
  resources :homilists
  resources :shots
  resources :rooms
  resources :ens_feeds
  resources :events
  resources :surveys
  resources :stripe_reports
  resources :marriage_talks
  resources :pray_fors
  resources :tasks
  resources :opportunities
  resources :sermons
  resources :members
  resources :todo_items
  resources :cards
  resources :participants
  resources :roles
  resources :todo_lists
  resources :vestry_minutes
  resources :vnotes
  resources :donations
  resources :users
  resources :links
  resources :albergue_children
  resources :anniversaries
  namespace :active_storage do
    resources :attachments
  end
  resources :books
  resources :comments
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :blobs
  end
  root to: 'dashboard#show'
end
