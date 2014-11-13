WifinderApp::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => 'users'}

  resources :cafes do
    put :favorite, on: :member
  end

  root :to => 'cafes#index' 

  get '/users/:id' => 'users#show' 

end
