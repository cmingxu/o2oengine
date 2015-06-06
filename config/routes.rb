Rails.application.routes.draw do

  get "add_cart" => "cart#add"
  get "remove_cart" => "cart#remove"
  get "decrease_cart" => "cart#decrease"
  get "carts" => "cart#index"
  patch "check_out" => "cart#check_out"

  resources :products, :only => [:index, :show]

  namespace :dashboard do
    get '/' => "base#index"
    resources :addresses
    resources :orders
  end

  namespace :admin do
    get '/' => "base#index"
    resources :sub_categories
    resources :categories do
      member do
        patch :move_higher
        patch :move_lower
      end
    end
    resources :branches do
      collection do
        get :list
      end
    end

    get 'settings/index'
    resources :cities
    resources :provices
    resources :shipments
    resources :addresses
    resources :users
    resources :order_items
    resources :orders
    resources :products

    namespace :lb do
      resources :products do
        member do
          patch :move_lower
          patch :move_higher
        end
      end
      resources :orders
    end

    get 'settings' => 'settings#index'
  end

  
  
  namespace :api do
    resource :wechat, controller: :wechat, only: [:show, :create]
  end

  get 'auth/wechat/callback' => "wechat/base#login_from_wechat"
  get 'auth/wechat/failure' => "wechat/base#failure"
  get 'auth/failure' => "wechat/base#failure"

  namespace :wechat do
    patch 'change_last_quantity' => "base#change_last_quantity"
    patch 'change_product' => "base#change_product"
    patch 'change_address' => "base#change_address"
    get "/" => "base#index"
    get 'order_confirm' => "base#order_confirm"
    post 'place_order' => "base#place_order"
    get 'orders' => "base#orders"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root 'welcome#index'

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
