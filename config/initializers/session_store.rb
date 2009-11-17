# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tutorial_rails_session',
  :secret      => 'd80ff244787044923b74d7963dee13b157cded2bec7398fb446f18c6ab6e4203e814aef08ed3e77655475233350e3469e19b7213e5ff5b3f4d61accd707473d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 ActionController::Base.session_store = :active_record_store
