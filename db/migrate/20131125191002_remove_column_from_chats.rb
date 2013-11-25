class RemoveColumnFromChats < ActiveRecord::Migration
  def change
    remove_column :chats, :message_id, :integer
  end
end
