Konnyaku::Application.routes.draw do

  root 'welcome#index'

  controller :welcome do
    get :index
    get :dashboard
    get :search
  end

  controller :sessions do
    get :sign_in, action: :new
    post :sessions, action: :create
    delete :sign_out, action: :destroy
  end

  resources :categories
  resources :posts do
    post :markdown, on: :collection
    resources :comments, only: [:create, :destroy]
    resources :versions, only: [:index, :show]
  end
  resources :tags, only: [:index, :show]

  # Cannot use :uploads because public/uploads exists
  resources :files, only: [:index, :create, :destroy], controller: :uploads, as: :uploads

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root to: 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
