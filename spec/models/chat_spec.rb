require 'spec_helper'

describe Chat do
  before :each do
    @mike = create(:user, username: "mike")
    @dan = create(:user, username: "dan")
    @chat = Chat.create(user_id: @dan.id, chatted_user_id: @mike.id)
    create(:message, chat_id: @chat.id, to: @mike.username, from: @dan.username)
    create(:message, chat_id: @chat.id, to: @dan.username, from: @mike.username)
  end

  context "initialization" do
    it "is valid with a user and a chatted user" do
      expect(@chat).to be_valid
    end

    it "is invalid without a chatted user" do
      expect(Chat.create(user_id: @dan.id)).not_to be_valid
    end

    it "is invalid without a user" do
      expect(Chat.create(chatted_user_id: @mike.id)).not_to be_valid
    end
  end

  context "Chat#generate" do
    it "creates a chat if one does not exist" do
      bob = create(:user, username: "bob")
      new_chat = Chat.generate(@dan, bob)
      expect(Chat.where("chatted_user_id = ?", bob.id).first).to eq(new_chat)
    end

    it "creates a chat if one does not exist" do

    end

    context "chat already created" do 
      it "finds a chat if one has been created from user to chatted user" do

      end

      it "find a chat if one has been created from chatted user to user" do

      end
    end

  end

end