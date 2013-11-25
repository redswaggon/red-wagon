class AddChattedUserIDtoChats < ActiveRecord::Migration
  def change
    add_column :chats, :chatted_user_id, :integer
  end
end
