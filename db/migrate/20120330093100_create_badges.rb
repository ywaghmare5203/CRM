class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :category, :string
      t.column :required_value, :integer
      t.timestamps
    end
  end
end
