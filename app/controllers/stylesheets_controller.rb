class StylesheetsController < ApplicationController
  caches_page :layout, :main, :errors, :admin, :nav, :maintenance

  skip_before_filter :login_required

  before_filter :do_colors

  ssl_allowed :main, :layout, :admin, :nav, :errors, :maintenance 
  
  layout false
  
  def do_colors
    @bg_color = RAILS_ENV == 'staging' ? "#ff9" : '#fff'
    @red = "#fcc"
    @light_red = "#fcc"
    @dark_blue = "#0b287f"
    @text_grey = "#404041"
    @grey_blue = "#e6e7f1"
    @light_grey = "#f8f7f9"
    @light_blue = "#6d99c8"    
    @dark_red = "#8a1e14"
    @gold = "#a38339"
    @yellow = "#fff668"
  end
  
  def do_respond_to
    respond_to do |format|
      format.css do 
        render
      end # end format.css
    end
  end
  
  def reset
    do_respond_to
  end
  
  def diagnostic
    do_respond_to
  end
  
  def diagnostic_ie7
    do_respond_to
  end
  
  def main
    do_respond_to
  end

  def layout
    do_respond_to
  end
  
  def admin
    do_respond_to
  end
 
  def nav
    do_respond_to
  end
  
  def errors
    do_respond_to
  end

  def maintenance
    do_respond_to
  end
end
