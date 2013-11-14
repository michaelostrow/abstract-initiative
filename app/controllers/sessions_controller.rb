class SessionsController < Devise::SessionsController
  
  def new
    @fancy_action_name = "Sign In"
  end
  
end
