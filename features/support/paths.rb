module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      root_path
    
    when /the signup page/
      signup_path
    
    when /the login page/
      login_path
      
    when /the logout page/
      logout_path
      
    when /the dashboard page/
      dashboard_path
    
    when /the activation page for the user "(.*)"/
      activation_user_path(User.find_by_login($1).id)
      
    when /the activation page/
      activation_user_path
    
    when /the forgot password page/
      forgot_password_path
      
    when /the reset password page with the reset token of "(.*)"/
      reset_password_path(:code => User.find(:first, :conditions => {:email => $1}).reset_token )
    
    when /the password reset instruction page/
      reset_instructions_path  
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
