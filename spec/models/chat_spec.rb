require 'spec_helper'

describe Chat do
  before :each do
    @mike = create(:user)
    @dan = create(:user)
  end

  context "initialization" do
    it "is valid with a user and a chatted user" do
      expect(Chat.create(user_id: @dan.id, chatted_user_id: @mike.id)).to be_valid
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
      new_chat = Chat.generate(@dan, @mike)
      expect(Chat.where("chatted_user_id = ?", @mike.id).first).to eq(new_chat)
    end

    context "chat already created" do 
      it "finds a chat if one has been created from user to chatted user" do
        Chat.create user_id: @dan.id, chatted_user_id: @mike.id
        num_of_chats = Chat.all.count
        Chat.generate(@dan, @mike)
        expect(Chat.all.count).to eq(num_of_chats)
      end

      it "find a chat if one has been created from chatted user to user" do
        Chat.create user_id: @mike.id, chatted_user_id: @dan.id
        num_of_chats = Chat.all.count
        Chat.generate(@dan, @mike)
        expect(Chat.all.count).to eq(num_of_chats)
      end
    end
  end

end