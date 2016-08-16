class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :place, :string
    add_column :users, :message, :string
  end
end
