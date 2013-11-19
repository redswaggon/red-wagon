RedWagon::Application.routes.draw do
  # OMNIAUTH FACEBOOK
  # root :to => 'users#index'
  # match '/auth/facebook/callback', to: 'sessions#create', via: [:get, :post]
  # match '/auth/failure', to: redirect('/'), via: [:get, :post]
  # match '/signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # post 'users/:id' => 'users#update'

  root :to => 'users#index'

  get '/users/:username' => 'users#show_wagon'
  get '/users/error' => 'users#error'
  
  get '/users/index' => 'users#index'
  get '/users/new' => 'users#new', as: 'new_user'
  get '/users/:username/edit' => 'users#edit', as: 'edit_user'
  get '/users/show/:username' => 'users#show', as: 'user'
  get '/users/destroy/:username' => 'users#destroy'
  post '/users/update/:username' => 'users#update'
  post '/users/create/:username' => 'users#create'
  post '/users/update/:username' => 'users#update'


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
