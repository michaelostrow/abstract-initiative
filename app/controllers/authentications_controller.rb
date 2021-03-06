class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    
    # Try to find authentication first
    authentication = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
    
    if authentication
      # Authentication found, sign the user in.
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication)
    else
      # Authentication not found, thus a new user.
      user = User.new
      user.apply_omniauth(auth)
      if user.save(:validate => false)
        if user.first_login
          sign_in(:user, user)
          redirect_to first_login_path
        end
      else
        flash[:error] = "Error while creating a user account. Please try again."
        redirect_to root_url
      end
    end
  end
end
