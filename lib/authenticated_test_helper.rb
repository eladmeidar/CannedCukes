module AuthenticatedTestHelper
  def log_in
    user = User.make
    user.activate!
    @request.session[:user_id] = user.id
  end

  def authorize
    user = User.make
    user.activate!
    @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.login, user.password)
  end
  
end
