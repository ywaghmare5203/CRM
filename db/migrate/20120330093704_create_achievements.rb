class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :user
      t.references :badge
      t.timestamps
    end
  end
end
