WifinderApp::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => 'users'}

  

  devise_scope :user do
    #get 'users' => 'users#index'
    resources :users,  only: [:index]
    resources :users, :only => [:show]
  end

  resources :cafes
  # resources :cafes_user
  post "/cafes_user/create"

  root :to => 'cafes#index' 

  get 'users/:id' => 'users#show' 

end
