class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://cannedcukes.heroku.com/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://cannedcukes.heroku.com/"
  end
  
  # TODO: Fix ugly link, you can use route helpers
  def reset_password_instructions(user)
    setup_email(user)
    @subject += "reset your password."
    
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "CannedCukes"
      @subject     = "CannedCukes: "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
