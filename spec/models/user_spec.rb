require 'spec_helper'

describe User do
  before :each do
    @user = build(:user, username: "bob")
    @user2 = build(:user)
    @user.save
    @user2.save
  end

  it "is valid with a unique username" do
    expect(@user).to be_valid
  end

  it "is invalid if the username already exists, no matter what casing" do
    expect(build(:user, username: "Bob")).to have(1).errors_on(:username)
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

  context "initializes with 5 items" do  
    it "is valid with 5 items" do
      expect(@user.items.count).to eq(5)
    end

    it "is invalid with more than 5 items" do
      user3 = build(:user)
      user3.save
      user3.items.create(name: "test")
      expect(user3.items.count).to eq(7)
    end
  end

end