class PublicController < ApplicationController
  skip_before_filter :login_required
  
  def index
  end

  def about
  end

  def contact
  end

end
