RedWagon::Application.routes.draw do
  root :to => 'sessions#new'

  # Sessions and Facebook
  match '/auth/facebook/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
    # ADD A FLASH NOTIFICATION HERE!
  match '/signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/sessions' => 'sessions#destroy', as: 'destroy_session'

  # Users
  put '/users/:username' => 'users#update'
  patch '/users/:username' => 'users#update'
  get '/users/:username' => 'users#show', as: 'user'
  delete '/users/:username' => 'users#destroy'
  get '/users' => 'users#index', as: 'users'
  get '/users/new' => 'users#new', as: 'new_user'
  get '/users/:username/edit' => 'users#edit', as: 'edit_user'
  get '/users/error' => 'users#error', as: 'error'
  get '/users/random_wagon_nearby/:username' => 'users#random_wagon_nearby', as: 'random_wagon_nearby'

  # Items
  get '/users/:username/items/:id/edit' => 'items#edit', as: 'edit_user_items'
  get '/users/:username/items/:id' => 'items#show', as: 'user_item'
  patch '/users/:username/items/:id' => 'items#update', as: 'item'
  put '/users/:username/items/:id' => 'items#update'
  post '/users/:username/items' => 'items#create', as: 'items'
  get '/items/:id/success' => 'items#success', as: 'success'
  post '/items/:id' => 'items#default'

  # Likes
  post '/likes/create' => 'likes#create', as: 'create_like'
  post '/likes/destroy' => 'likes#destroy', as: 'destroy_like'

  # Chats
  resources :users do
    resources :chats, only: [:index, :show]
  end

  # Messages
  post "messages/create" => 'messages#create', as: "messages"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
