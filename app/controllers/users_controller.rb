class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    Rails::logger.info "test"
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to dashboard_path
    end
  end

  def dashboard
    if current_user.nil?
      redirect_to new_user_session_path, :alert => "You'll need to log in to view your dashboard!"
    end
  end
  
  def update
    authorize! :update, @user, :message => 'Logged in as a NON-admin account.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Logged in as a NON-admin account.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end
