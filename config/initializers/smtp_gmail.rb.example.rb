require "smtp_tls" 
ActionMailer::Base.smtp_settings = { 
  :address => "smtp.gmail.com", 
  :port => 587, 
  :user_name => "adamfleck@pcgi.it", 
  :password => "lewis111", 
  :authentication => :plain 
} 
