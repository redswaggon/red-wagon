class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.integer :liked_user
      t.timestamps
    end
  end
end
