ActionController::Routing::Routes.draw do |map|

  map.resources :roles

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users, :member => { :suspend   => :put,
                                         :unsuspend => :put,
                                         :purge     => :delete }
  map.resource :session
  
  map.forgot_password '/forgot_password', :controller => 'users', :action => 'forgot_password'
  map.reset_password '/reset_password/:password_reset_code', :controller => 'users', :action => 'reset_password'
  map.change_password '/change_password', :controller => 'users', :action => 'change_password'

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  


  map.admin "admin", :controller => "admin", :action => "index"
  map.namespace(:admin) do |admin| 
    admin.resources :roles, :config_values, :users, :pages, :preferences, :opportunities, :resources, :clients
    
    # admin.resources :faq_categories, :member => { :up => :put, :down => :put } do |cat|
    #   cat.resources :faqs, :member => { :up => :put, :down => :put }
    # end
    admin.superuser_member_override "superuser_member_override", :controller => "members", :action => "superuser_member_override"
  end

  # Install the default routes as the lowest priority.
  map.root :controller => "public"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
