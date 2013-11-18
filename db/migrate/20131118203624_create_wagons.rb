class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
