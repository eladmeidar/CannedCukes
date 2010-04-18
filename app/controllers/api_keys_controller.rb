class ApiKeysController < ApplicationController
  
  before_filter :login_required
  
  def create
    current_user.enable_api!
    
    flash[:notice] = "API enabled"
    respond_to do |format|
      format.html { redirect_to user_url(current_user) }
    end
  end

  # Delete the API key
  def destroy
    current_user.disable_api!
    flash[:notice] = "API disabled"
    respond_to do |format|
      format.html { redirect_to user_url(current_user) }
    end
  end
    
end
