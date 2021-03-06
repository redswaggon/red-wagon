class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, index: true
      t.string :photo
      t.timestamps
    end
  end
end
