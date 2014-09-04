Rails.application.routes.draw do
  root 'magaz#home'
  get 'magaz/categories'
  #match '/categories', to: 'magaz#categories', via: 'get'
  get 'magaz/products/(:page)', to: 'magaz#products', as: 'magaz_products', defaults: {page: 1}, constraints: {page: /\d+/}
  #match '/products', to: 'magaz#products', via: 'get'
  get 'magaz/product/:id', to: 'products#show', as: 'product', defaults: {id: 1}, constraints: {id: /\d+/}
  #match '/products/:id', to: 'products#show', as: 'product', via: 'get'
  get 'magaz/categories/:id', to: 'categories#show', as: 'category'
    #match '/categories/:id', to: 'categories#show', as: 'category', via: 'get'
  get 'magaz/cart', to: 'cart#show', as: 'cart'

  post 'magaz/cart/add', to: 'cart#add', as: 'addcart' #написали to: 'cart#add', потому что контроллер cart_controller, а в нем метод def add

  get 'magaz/cart/addresult', to: 'cart#addresult', as: 'addcartresult'
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
