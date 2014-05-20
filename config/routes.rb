GameScheduleApp::Application.routes.draw do
 root 'leagues#index'

  resources :leagues, shallow: true do 
    resources :players
    resources :days
    resources :teams
    resources :games
  end
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # get 'leagues/' => 'leagues#index'
  # get 'leagues/new' => 'leagues#new'
  # get 'leagues/:id' => 'leagues#show', as: :league
  # post 'leagues/' => 'leagues#create'
  # get 'leagues/:id/edit' => 'leagues#edit', as: :edit_league
  # patch 'leagues/:id' => 'leagues#update'
  # delete 'leagues/:id' => 'leagues#destroy'

  # get 'teams/' => 'teams#index'
  # get 'teams/new' => 'teams#new'
  # post 'teams/' => 'teams#create'
  # get 'teams/:id' => 'teams#show', as: :team
  # get 'teams/:id/edit' => 'teams#edit', as: :edit_team
  # patch 'teams/:id' => 'teams#update'
  # delete 'teams/:id' => 'teams#destroy'

  # get 'games/' => 'games#index'
  # get 'games/new' => 'games#new'

  get 'players/' => 'players#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  get 'leagues/:id' => 'leagues#show'

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
