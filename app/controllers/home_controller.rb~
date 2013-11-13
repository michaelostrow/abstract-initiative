class HomeController < ApplicationController
  def index_eventual
    @new_posts = BlogPost.all
    if current_user
      redirect_to user_path current_user
    end
    @users = User.all    
    render :layout => "stranger"
  end

  def index # Development mode index
    @users = User.all
    @new_posts = BlogPost.all
  end

  def tour
    redirect_to root_path if current_user.nil?
  end

  def confirming    
    @conf = session[:conf]
    redirect_to root_path if flash.none?
  end

  def section
    @section = params[:section]
    render "#{@section}/index"
  end

  def random
    flash[:message] = "Not a thing yet"
    redirect_to root_path
  end
  
end
