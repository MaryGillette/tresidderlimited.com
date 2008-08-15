class AdminController < ApplicationController  
  include ListMethods
  
  layout "admin"
  
  require_role "administrator"

  # notify and redirect
  def access_denied
    if logged_in?
      UserMailer.deliver_access_attempt_notification(current_user,request.request_uri)
      redirect_with_flash("Insufficient Permissions. Incident has been reported.", root_path) and return
    else
      redirect_with_flash("Access Denied.", root_path) and return
    end
  end
    
  ssl_required :index, :edit, :destroy, :update, :create, :new, :show, :superuser_member_override
  
  def index
    
  end
  
  

end