class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :index, :show, :dashboard, :detail]

  def edit
    @user = current_user
  end

  def index
    @users = User.all
  end

  def show
    @detail = "profile"
    if not current_user
      flash[:alert] = "You need to sign in to view user accounts."
      redirect_to root_url
    end
    if params[:ident].to_i == 0
      @user = User.find_by_url_slug params[:ident]
    else
      @user = User.find params[:ident]
    end
    if @user.nil?
      flash[:alert] = "No such member exists."
      redirect_to root_url
    else
      @fancy_action_name = @user.name
    end
  end

  def dashboard
    if current_user.nil?
      redirect_to new_user_session_path, :alert => "You'll need to log in to view your dashboard!"
    end
  end
  
  def update
    @user = current_user
    first_login = @user.first_login
    respond_to do |format|
      params[:user][:first_login] = false
      if @user.update_attributes(params[:user])
        @user.slugify_slug
        if first_login
          format.html { redirect_to tour_path, notice: 'Okay, thanks for the updates!' }
          format.json { head :no_content }
        else
          format.html { redirect_to user_path(@user.url_slug), notice: 'Okay, thanks for the updates!' }
        end        
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
    if params[:ident].to_i == 0
      @user = User.find_by_url_slug params[:ident]
    else
      @user = User.find params[:ident]
    end
    if params[:property] == "messages"
      if params[:m]
        @messages_tab = params[:m]
      else
        @messages_tab = "inbox"
      end
    end
    if request.xhr?
      render "detail_#{params[:property]}", :layout => false
    else
      @detail = params[:property]
      @fancy_action_name = @detail.titlecase
      render "show"
    end
  end

end
