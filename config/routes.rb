UpfrontwichitaCom::Application.routes.draw do
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

  resources :challenges do
      resources :submissions
  end

  #i don't think we need to nest comments under submissions.
  resources :comments

end
