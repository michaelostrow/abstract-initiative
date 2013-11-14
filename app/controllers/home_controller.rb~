class HomeController < ApplicationController
  def index_eventual
    @new_posts = BlogPost.all
    @users = User.all    
#    render :layout => "stranger"
  end

  def tour
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
  
end
