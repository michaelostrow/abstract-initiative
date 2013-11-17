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

  def contact
    @fancy_action_name = "Support"
  end
  
  def first_login
    @user = current_user    
    if @user.nil?
      redirect_to root_path
    end
    begin
      if not @user.first_login
        redirect_to user_edit_path
      end
    rescue
      # Rails is going full retard, so we'll rescue the error that should never happen
    end
  end

end
