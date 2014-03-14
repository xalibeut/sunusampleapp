# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Sunusampleapp::Application.config.secret_key_base = 'ada25912d18675c1490f5be8c9caa839b72385246b37c0f1df5b4da8ebc28cb2f90cb74a6d7f358f8ebd29f922ca79e6b9612179bd2c3431b03ddb185fcd461a'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
Sunusampleapp::Application.config.secret_key_base = secure_token