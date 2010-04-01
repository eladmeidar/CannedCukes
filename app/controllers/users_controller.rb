class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.html.erb
  def new
    @user = User.new
  end
  
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to :action => 'activation', :id => @user
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error] = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      @user.password = @user.password_confirmation = nil
      render :action => 'new'
    end
  end
  
  # Forgot Password
  def forgot
    # Do nothing it's just a view
  end
  
  def reset_instructions
    if @user = User.find(:first, :conditions => {:email => params[:email]})
      flash.now[:notice] = "Password reset instructions sent."
      @user.make_reset_token
      
      # TODO: Remove emails to an outgoing service.
      UserMailer.deliver_reset_password_instructions(@user)
    else
      flash.now[:error] = "Could not find a user with that email address."
      respond_to do |page|
        page.html { render :action => 'forgot' }
      end
    end
  end
  
  def reset_password
    if params[:code].present?
      unless @user = User.find(:first, :conditions => {:reset_token => params[:code]})
        flash[:error] = "Could not find a user with that passowrd reset token, Please follow the URL from your email."
        redirect_to root_url
      end
    else
      flash[:error] = "Could not find a user with that passowrd reset token, Please follow the URL from your email."
      redirect_to root_url
    end
  end
  
  def update_password
    logout_keeping_session!
    if @user = User.find(:first, :conditions => {:reset_token => params[:reset_token]})

      if @user.change_password(params[:password], params[:password_confirmation])
        @user.clear_reset_token
        flash[:notice] = "Your password was updated successfully, Please login using your new password"
        respond_to do |page|
          page.html { redirect_to login_url }
        end
      else
        respond_to do |page|
          page.html { render :action => 'reset_password' }
        end
      end
    end
  end
  
  def activation
    @user = User.find(params[:id])
  end
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

end
