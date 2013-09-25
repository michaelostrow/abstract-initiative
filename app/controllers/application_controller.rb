class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_up_path_for(resource_or_scope)
    confirming_path
  end


   # custom 404
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound,
    ActionController::RoutingError,
    ActionController::UnknownController,
    ActionController::UnknownAction,
    ActionController::MethodNotAllowed do |exception|
      
      # Put loggers here, if desired.
      
      redirect_to not_found_path
    end
  end
  
end
