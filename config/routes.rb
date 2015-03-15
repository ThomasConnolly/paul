# == Route Map
#
#                   Prefix Verb   URI Pattern                                 Controller#Action
#              users_index GET    /users/index(.:format)                      users#index
#               users_show GET    /users/show(.:format)                       users#show
#            opportunities GET    /opportunities(.:format)                    opportunities#index
#                          POST   /opportunities(.:format)                    opportunities#create
#          new_opportunity GET    /opportunities/new(.:format)                opportunities#new
#         edit_opportunity GET    /opportunities/:id/edit(.:format)           opportunities#edit
#              opportunity GET    /opportunities/:id(.:format)                opportunities#show
#                          PATCH  /opportunities/:id(.:format)                opportunities#update
#                          PUT    /opportunities/:id(.:format)                opportunities#update
#                          DELETE /opportunities/:id(.:format)                opportunities#destroy
#                homilists GET    /homilists(.:format)                        homilists#index
#                          POST   /homilists(.:format)                        homilists#create
#             new_homilist GET    /homilists/new(.:format)                    homilists#new
#            edit_homilist GET    /homilists/:id/edit(.:format)               homilists#edit
#                 homilist GET    /homilists/:id(.:format)                    homilists#show
#                          PATCH  /homilists/:id(.:format)                    homilists#update
#                          PUT    /homilists/:id(.:format)                    homilists#update
#                          DELETE /homilists/:id(.:format)                    homilists#destroy
#                    books GET    /books(.:format)                            books#index
#                          POST   /books(.:format)                            books#create
#                 new_book GET    /books/new(.:format)                        books#new
#                edit_book GET    /books/:id/edit(.:format)                   books#edit
#                     book GET    /books/:id(.:format)                        books#show
#                          PATCH  /books/:id(.:format)                        books#update
#                          PUT    /books/:id(.:format)                        books#update
#                          DELETE /books/:id(.:format)                        books#destroy
#                  sermons GET    /sermons(.:format)                          sermons#index
#                          POST   /sermons(.:format)                          sermons#create
#               new_sermon GET    /sermons/new(.:format)                      sermons#new
#              edit_sermon GET    /sermons/:id/edit(.:format)                 sermons#edit
#                   sermon GET    /sermons/:id(.:format)                      sermons#show
#                          PATCH  /sermons/:id(.:format)                      sermons#update
#                          PUT    /sermons/:id(.:format)                      sermons#update
#                          DELETE /sermons/:id(.:format)                      sermons#destroy
#                 profiles GET    /profiles(.:format)                         profiles#index
#                          POST   /profiles(.:format)                         profiles#create
#              new_profile GET    /profiles/new(.:format)                     profiles#new
#             edit_profile GET    /profiles/:id/edit(.:format)                profiles#edit
#                  profile GET    /profiles/:id(.:format)                     profiles#show
#                          PATCH  /profiles/:id(.:format)                     profiles#update
#                          PUT    /profiles/:id(.:format)                     profiles#update
#                          DELETE /profiles/:id(.:format)                     profiles#destroy
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#            post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                          POST   /posts/:post_id/comments(.:format)          comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)      comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)      comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
#                    posts GET    /posts(.:format)                            posts#index
#                          POST   /posts(.:format)                            posts#create
#                 new_post GET    /posts/new(.:format)                        posts#new
#                edit_post GET    /posts/:id/edit(.:format)                   posts#edit
#                     post GET    /posts/:id(.:format)                        posts#show
#                          PATCH  /posts/:id(.:format)                        posts#update
#                          PUT    /posts/:id(.:format)                        posts#update
#                          DELETE /posts/:id(.:format)                        posts#destroy
#                 ckeditor        /ckeditor                                   Ckeditor::Engine
#              attachinary        /attachinary                                Attachinary::Engine
#                     root GET    /                                           sermons#index
#
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
#
# Routes for Attachinary::Engine:
#   cors GET  /cors(.:format) attachinary/cors#show {:format=>"json"}
#

Rails.application.routes.draw do

  
  
  get 'users/index'

  get 'users/show'

  resources :opportunities
  resources :homilists
  resources :books
  resources :sermons
  resources :profiles
  devise_for :users
  resources :posts do
    resources :comments
  end
  
  mount Ckeditor::Engine => '/ckeditor'
  mount Attachinary::Engine => '/attachinary'
  root to: 'sermons#index'
end
