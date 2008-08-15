class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'  
    @body[:url]  = "http://YOURSITE/activate/#{user.activation_code}"
  end

  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end


  def reset_password(user)
    setup_email(user)
    @subject    += 'Did you forget your password?'
    @body[:url]  = "http://YOURSITE/reset_password/#{user.reset_code}"
  end

  def access_attempt_notification(user,request_uri)
    setup_email(User.find(1))    
    @subject    += 'Unauthorized Access Attempt'
    @body[:member] = user
    @body[:url] = request_uri
  end

  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "ADMINEMAIL"
    @subject     = "[YOURSITE] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
