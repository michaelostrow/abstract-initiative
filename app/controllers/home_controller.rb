class HomeController < ApplicationController
  def index
    @new_posts = BlogPost.all
    if current_user
      redirect_to user_path current_user
    end
    @users = User.all    
    render :layout => "stranger"
  end

  def tour
    redirect_to root_path if current_user.nil?
  end

  def confirming    
    redirect_to root_path if flash.none?
  end
  
end
