class UsersController < ApplicationController
  require_role 'administrator', :only => [:suspend, :unsuspend, :destroy, :purge]
  
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  skip_before_filter :login_required # , :only => [:forgot_password, :reset_password, :activate, :get_announcements]
  
  ssl_required :registration, :activate, :resend_invite, :suspend, :unsuspend, :destroy, :purge, :forgot_password, :reset_password, :change_password
  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.register! if @user && @user.valid?
    success = @user && @user.valid?
    if success && @user.errors.empty?
            redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.activated?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def forgot_password
    if request.post?
      user = User.find_by_email(params[:user][:email]) unless params[:user][:email].blank?
      case
      when (!params[:user][:email].blank?) && user && user.activated?
        user.make_reset_code!
        flash[:notice] = "A password reset link was sent to #{user.email}"
        redirect_back_or_default('/')
      when params[:user][:email].blank?
        flash[:error] = "The email address was missing.  Please enter your email address."
        redirect_back_or_default('/')
      else
        flash[:error] = "We couldn't find a user with the email address, '#{params[:user][:email]}' or the user is suspended, deleted, or not activated."
        redirect_back_or_default('/')
      end
    end
  end

  def reset_password
    if request.post?
      @user = User.find_by_email_and_reset_code(params[:user][:email], params[:password_reset_code])
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        @user.clear_reset_code!
        self.current_user = @user
        flash[:notice] = "Password reset successfully for #{@user.email}"
        redirect_back_or_default("/")
      else
        render :action => :reset
      end
    end
  end
  
  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end
  
  # There's no page here to update or destroy a user.  If you add those, be
  # smart -- make sure you check that the visitor is authorized to do so, that they
  # supply their old password along with a new one to update it, etc.

protected
  def find_user
    @user = User.find(params[:id])
  end
end
