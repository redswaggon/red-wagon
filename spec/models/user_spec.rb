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

  context "determines if wagon is empty" do
    it "wagon is empty" do
      expect(@user.empty_wagon?).to be_true
    end

    it "wagon has at least one item" do
      @user2.items.create(photo_file_name: "test_file")
      expect(@user2.empty_wagon?).to be_false
    end
  end

end