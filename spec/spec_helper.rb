# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  OmniAuth.config.test_mode = true  
  omniauth_hash = {
    'uid' => '9675309',
    'provider' => 'Facebook',
    'info' => {'name' => 'Bob Boberts'},
    'credentials' => {
      'token' => 'umad',
      'secret' => 'bro?',
      'expires_at' => Time.now + (2*7*24*60*60)}
    }
  OmniAuth.config.add_mock(:facebook, omniauth_hash)

  config.include LoginMacros
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
