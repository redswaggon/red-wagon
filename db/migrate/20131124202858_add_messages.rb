class AddMessages < ActiveRecord::Migration
   def change
    create_table :messages do |t|
      t.integer :chat_id
    end
  end
end
