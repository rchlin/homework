Homework::Application.routes.draw do
  resources :users do
    resources :equipments
    resources :orders
  end
  resources :equipments do
    resources :orders
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :equipments, only: [:new, :create]
  #resources :orders

  match '/signin', to:'sessions#new'
  match '/signup', to:'users#new'
  match '/signout', to:'sessions#destroy', via: :delete

  root to:'home_pages#home'

  match '/manager', to: 'home_pages#manager'
  match '/users/:user_id/manager_orders', to: 'home_pages#manager_orders'
  match '/manager/:order_id/order', to: 'home_pages#check_order'
  match '/manager/:order_id/check', to: 'home_pages#check', via: :put
  match '/search', to: 'home_pages#search'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
