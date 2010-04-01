# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cannedcukes_session',
  :secret      => 'c4660d59b20b11cbaae813f882196bc14bc8bc0fa7cec2cd1fc3a8d6cae90b376bc91932261d7b074ec1e5f716cfed62fcca75b920d566dd358d35233b81f6c1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
