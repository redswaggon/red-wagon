class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :wagon
      t.integer :liked_wagon
      t.timestamps
    end
  end
end
