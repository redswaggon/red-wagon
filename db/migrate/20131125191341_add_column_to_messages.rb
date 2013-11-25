class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :string
    add_column :messages, :from, :string
  end
end
