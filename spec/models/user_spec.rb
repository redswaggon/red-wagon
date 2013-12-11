require 'spec_helper'

describe User do
  before :each do
    @user = User.create(
      username: 'Aaron',
      name: 'ASummers',
      email: 'tester@example.com')
    @user2 = User.create(
      username: "danny",
      name: "Dan",
      email: "dan@example.com")
  end

  after :each do
    
  end

  it "is valid with a unique username" do
    expect(@user).to be_valid
  end

  it "is invalid if the username already exists, no matter what casing" do
    expect(User.new(username: "aaron")).to have(1).errors_on(:username)
  end

  it "returns the user's username when calling to_param" do
    expect(@user.to_param).to eq(@user.username)
  end

  it "returns mutually liked users when calling mutually liked users" do
    @user.likes.create(liked_user_id: @user2.id)
    @user2.likes.create(liked_user_id: @user.id)
    expect(@user2.mutually_liked_users).to include @user
  end

  # it "creates a chat given two user ids" do
  #   @user.stub(:current_user) {@user}
  #   @user.create_chat(user_id: @user.id, chatted_user_id: @user2.id)
  #   expect(Chat.find_by(user_id: @user.id)).not_to be_empty
  # end

  it "returns true if a wagon is empty" do
    pending
  end

  it "returns false if a wagon has at least one item" do
    pending
  end

  it "creates a user with valid attributes from an omniauth hash" do
    pending
  end
end