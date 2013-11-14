class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :index, :show, :dashboard, :detail]

  def index
    @users = User.all
  end

  def show
    Rails::logger.info "test"
    @user = User.find(params[:id])
    @fancy_action_name = @user.name
    @detail = "profile"
  end

  def dashboard
    if current_user.nil?
      redirect_to new_user_session_path, :alert => "You'll need to log in to view your dashboard!"
    end
  end
  
  def update
    
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], as: :admin)
      redirect_to :back, :notice => "Updated #{@user.name}'s account."
    else
      redirect_to :back, :alert => "Unable to update user."
    end
  end
    
  def destroy
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end


  def detail    
    @user = User.find params[:id]
    if request.xhr?
      render "detail_#{params[:property]}", :layout => false
    else
      @detail = params[:property]
      @fancy_action_name = @detail.titlecase
      render "show"
    end
  end


end
