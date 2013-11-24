class AddChats < ActiveRecord::Migration
   def change
    create_table :chats do |t|
      t.integer :user_id
    end
  end
end
