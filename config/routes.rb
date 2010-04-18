ActionController::Routing::Routes.draw do |map|
  
  # Login/logout
  map.logout '/logout', :action => 'destroy', :controller => 'sessions'
  map.login '/login', :action => 'new', :controller => 'sessions'
  map.register '/register', :action => 'create', :controller => 'users'
  map.signup '/signup', :action => 'new', :controller => 'users'
    
  # Activation
  map.activate '/activate/:activation_code', :action => 'activate', :controller => 'users', :activation_code => ''
  
  # Password restore
  map.forgot_password '/forgot', :controller => 'users', :action => 'forgot'
  map.reset_instructions '/reset_password_instructions', :controller => 'users', :action => 'reset_instructions'
  map.reset_password '/reset_password/:code', :controller => 'users', :action => 'reset_password', :code => nil
  map.update_password '/update_password', :controller => 'users', :action => 'update_password'
  map.resources :users, :member => {:activation => :get, :forgot => :get} do |users|
    users.resource :api_key
    users.resources :features do |features|
      features.resources :scenarios
    end
  end
  
  map.resources :scenarios
  
  map.resource :session
  map.resource :dashboard, :controller => "dashboard"
  
  map.root :controller => 'sessions', :action => 'new'
end
