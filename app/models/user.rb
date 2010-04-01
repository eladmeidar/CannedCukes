require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include ToSlug
  
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  before_create :make_activation_code 

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation

  has_many :features, :order => 'created_at'

  def features_for_select
    features.collect {|feature| [feature.title, feature.id]}
  end
  
  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login_or_email, password)
    return nil if login_or_email.blank? || password.blank?
    user = first(:conditions => {:login => login_or_email, :activation_code => nil}) || first(:conditions => {:email => login_or_email, :activation_code => nil})
    (user && user.authenticated?(password) ? user : nil) unless user.nil?
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def make_reset_token
    self.reset_token = self.class.make_token
    save(false)
  end
  
  def clear_reset_token
    update_attribute(:reset_token, nil)
  end
  
  def change_password(new_password, confirmation)
    if new_password != confirmation 
      errors.add(:password, "doesn't match confirmation")
      false
    elsif new_password.blank?
      errors.add(:password, "can't be blank")
      false
    else
      password = new_password
      password_confirmation = confirmation
      save      
    end
  end
  
  def to_param
    "#{id}-#{sluggify(login)}"
  end
  
  protected
    
    def make_activation_code
        self.activation_code = self.class.make_token
    end


end
