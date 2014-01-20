require 'spec_helper'

describe User do
  let(:user) { create(:user, username: "bob") }
  let(:user2) { create(:user) }

  describe "associates with likes, messages, items and neighborhoods" do
    it { should have_many(:likes) }
    it { should have_many(:liked_users).through(:likes) }
    it { should have_many(:items) }
    it { should have_many(:messages) }
    it { should have_and_belong_to_many(:neighborhoods) }
  end

  describe "initializes unique users" do
    context "when username is unique" do
      it { should validate_uniqueness_of(:username).case_insensitive }
    end

    context "when username already exists" do
      it "returns an error" do
        user
        expect(build(:user, username: "Bob")).to have(1).errors_on(:username)
      end
    end
  end

  describe "handles usernames and mutually liked users" do  
    context "when calling to_param" do
      it "returns the user's username" do
        expect(user.to_param).to eq(user.username)
      end
    end

    context "when calling mutually liked users" do
      it "returns mutually liked users" do
        user.likes.create(liked_user_id: user2.id)
        user2.likes.create(liked_user_id: user.id)
        expect(user2.mutually_liked_users).to include user
      end
    end
  end

  describe "#empty_wagon?" do
    context "when wagon is empty" do
      it "returns true" do
        expect(user.empty_wagon?).to be_true
      end
    end

    context "when wagon has at least one item" do
      it "returns false" do
        user2.items.create(photo_file_name: "test_file")
        expect(user2.empty_wagon?).to be_false
      end
    end
  end

end