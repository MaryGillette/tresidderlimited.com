module ListMethods
  def up
    eval "#{params[:controller].classify}.find(params[:id]).move_higher"
    eval "redirect_to #{params[:controller].gsub("/","_")}_url"
  end

  def down
    eval "#{params[:controller].classify}.find(params[:id]).move_lower"
    eval "redirect_to #{params[:controller].gsub("/","_")}_url"
  end
end