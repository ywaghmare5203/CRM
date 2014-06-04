class AddRoalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roal, :integer, :default => 0
  end
end
