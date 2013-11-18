class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.timestamps
    end

    create_table :neighborhoods_users do |t|
      t.belongs_to :neighborhood
      t.belongs_to :user
    end
  end
end
