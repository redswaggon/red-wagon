# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RedWagon::Application.initialize!

provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

