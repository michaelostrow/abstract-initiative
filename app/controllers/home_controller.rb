class HomeController < ApplicationController
  def tour
    current_user.update_attribute(:first_login, false)
    redirect_to root_path if current_user.nil?
  end

  def confirming    
    @conf = session[:conf]
    redirect_to root_path if flash.none?
  end

  def random
    flash[:message] = "Not a thing yet"
    redirect_to root_path
  end

  def contact
    @fancy_action_name = "Support"
  end
  
  def first_login
    @user = current_user    
    if @user.nil?
      redirect_to root_path
    else
      redirect_to user_path(@user.safe_slug) unless @user.first_login
    end
  end

end
