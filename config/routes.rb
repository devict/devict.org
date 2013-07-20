UpfrontwichitaCom::Application.routes.draw do
  get "posts/index"

  match "videos" => "video#index"

  root :to => "welcome#index"

  # IRC Chat Client
  get "irc/index"
  get "irc/alt"
  get "irc/alt2"

  # Our Sign In/Out page
  match "/signin"  => "services#signin"
  match "/signout" => "services#signout"

  # Callback from authorization
  match '/auth/:service/callback' => 'services#create'
  match '/auth/failure' => 'services#failure'
  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end

  # Members pages
  resources :users, :only => [:index, :show, :edit, :update] do
  end

  # Service for our IRC bot to update the list of logged in IRC users
  resources :irc_users, :only => [:create, :destroy] do
      collection do
          post 'batch'
      end
  end

  resources :events, :only => [:index, :show]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match "/irc", :to => 'irc#index'

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

  resources :challenges do
      resources :submissions
  end

  #i don't think we need to nest comments under submissions.
  resources :comments

end
