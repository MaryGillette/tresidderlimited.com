# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  include Userstamp
  include ExceptionNotifiable 
    
  layout 'main'
  helper :all
  protect_from_forgery :secret => 'bc79e2619efcc2a2a60a5ac147309986'
  filter_parameter_logging :password, :password_hash, :password_salt, :email

  include SslRequirement

  skip_before_filter :ensure_proper_protocol if ['development','test','staging'].include?(RAILS_ENV)
      
  before_filter :login_required #, :do_system_config
  
  def do_system_config
    @config_values = Hash[*ConfigValue.find(:all).map {|cv| [cv.name,cv.value] }.flatten]
  end
  
  def redirect_with_flash(message, destination_path)
    flash[:notice] = message
    redirect_to destination_path and return
  end
end
