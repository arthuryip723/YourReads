Rails.application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
  end

  namespace :api, defaults: { format: :json } do
    resources :books, except: [:new, :edit] do
      collection do
        get 'my_books'
      end
    end
    resources :authors, except: [:new, :edit]
    resources :reviews, except: [:new, :edit]
    resources :shelves, except: [:new, :edit] do

    end
    resources :shelvings, except: [:new, :edit]

    resources :friendships, except: [:new, :edit]
    resources :friend_requests, except: [:new, :edit] do
      member do
        post 'accept'
        post 'reject'
      end
    end

    get "/search", to: "static_pages#search"

    resource :session, only: [:show, :create, :destroy]
    resources :users, only: [:index, :show, :create] do
      collection do
        get 'friends'
      end
    end
    # resources :ratings, except: [:new, :edit]
    # resources :items
    # resources :board_memberships
    # resources :card_assignments
  end
  get "/auth/:provider/callback", to: "sessions#omniauth"
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
