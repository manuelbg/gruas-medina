# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gruas-medina_session',
  :secret      => 'eaad9e7e09f66b0af6db3b5a1a57387ce0129e8c7e50662d6d0e2ae22245edabb775ca34bbe9fad6bcbf226c7460c4d3ec9f5640728b445ed0132296767ad721'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
