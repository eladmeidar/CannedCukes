# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  def login_from_api_key
    self.current_user = User.find_by_api_key(params[:api_key]) if params[:api_key].present?
  end
  
end
