require 'spec_helper'

describe User do
  it "is valid with a unique username" do
    user = User.new(
      username: 'Aaron',
      name: 'ASummers',
      email: 'tester@example.com')
    expect(user).to be_valid
  end

  it "is invalid if the username already exists, no matter what casing" do
    user = User.create(
      username: 'Aaron',
      name: 'ASummers',
      email: 'tester@example.com')
    expect(User.new(username: "aaron")).to have(1).errors_on(:username)
  end

  it "returns the user's username when calling to_param" do
    
  end

  it "returns mutually liked users when calling mutually liked users" do
    pending
  end

  it "returns true if a wagon is empty" do
    pending
  end

  it "returns false if a wagon has at least one item" do
    pending
  end

  it "creates a user with valid attributes from an omniauth hash" do
    pending
  end

  it "creates a chat given two user ids" do
    pending
  end

end