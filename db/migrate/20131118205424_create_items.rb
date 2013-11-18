class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :wagon, index: true
      t.string :photo_file_path
      t.timestamps
    end
  end
end
