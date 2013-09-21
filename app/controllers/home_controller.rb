class HomeController < ApplicationController
  def index
    if current_user
      redirect_to user_path current_user
    end
    @users = User.all
    render :layout => "stranger"
  end

  def tour
    @user = current_user
    render :layout => "application"
  end

  def confirming    
    redirect_to root_path if flash.none?
  end
  
end
