RSpec::Matchers.define :require_login do |expected|
  match do |actual|
    expect(actual).to redirect_to Rails.application.routes.url_helpers.root_path
  end

  failure_message_for_should do |actual|
    "expected to redirect non-logged in users to root url"
  end

  failure_message_for_should_not do |actual|
    "expected not to redirect non-logged in users to root url"
  end

  description do
    "redirect to login users at root url"
  end
end