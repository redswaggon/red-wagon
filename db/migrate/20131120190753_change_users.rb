class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :salt, :string
    remove_column :users, :encrypted_password, :string
    add_column :users, :
  end
end
