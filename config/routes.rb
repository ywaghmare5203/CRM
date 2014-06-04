Singchana::Application.routes.draw do

  get "songs/index"
  get "songs/search"
  get "songs/artist/:id" => "songs#artist"
  get "songs/album/:id" => "songs#album"
  
  get "karaoke/:id" => "karaoke#index", :constraints => {:id => /\d+/}, :as => "karaoke"
  get "karaoke/song_transcript"
  post "karaoke/submit_score"
  match "new" => "admin#new", :as => :new_admin
  match "admin_create" => "admin#admin_create", :as => :admin_create
  match "admin_login" => "admin#admin_login", :as => :login1
  match "login_admin" => "admin#login_admin", :as => :login
  match "/admin/dashboard" => "admin#dashboard"
  match "logout" => "admin#logout", :as => :log_out


  match "dashboard" => "admin#dashboard", :as => :dashboard
  match "create"  => "admin#create",  :as => :create_song

  match "new_album" => "album#new_album", :as => :new_album
  match "create_album" => "album#create_album", :as => :create_album

  match "new_artist" => "artist#new_artist", :as => :new_artist
  match "create_artist" => "artist#create_artist", :as => :create_artist

  match "new_music" => "music#new_music", :as => :new_music
  match "create_music" => "music#create_music", :as => :create_music
  match "admin_logout" => "admin#admin_logout", :as => :admin_logout

  match "add_song" => "admin#add_song",  :as => :add_song

  match "music_list" => "music#music_list", :as => :music_list
  match "album_list" => "album#album_list", :as => :album_list
  match "artist_list" => "artist#artist_list", :as => :artist_list

  match "edit_musics/:id" => "music#edit_musics", :as => :edit_music
  match "destroy_music/:id" => "music#destroy_music",  :as => :destroy_music
  match "/edit/:id" => "music#edit", :as => :edit_music_type

  match "edit_album/:id" => "album#edit_album", :as => :edit_album
  match "destroy_album/:id" => "album#destroy_album",  :as => :destroy_album
  match "/album_edit/:id" => "album#album_edit", :as => :edit_album_type

  match "edit_artist/:id" => "artist#edit_artist", :as => :edit_artist
  match "destroy_artist/:id" => "artist#destroy_artist",  :as => :destroy_artist
  match "/artist_edit/:id" => "artist#artist_edit", :as => :edit_artist_type


  resources "users"
  resources "album"
  resources "artist"
  resources "music"
  resource "user_session", only: %w(new create destroy)
  resource "password_reset", only: %w(new create edit update)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'songs#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
