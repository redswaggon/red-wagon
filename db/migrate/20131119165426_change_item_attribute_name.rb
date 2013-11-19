class ChangeItemAttributeName < ActiveRecord::Migration
  def change
    remove_column :items, :photo_file_path
    add_attachment :items, :photo
  end
end
