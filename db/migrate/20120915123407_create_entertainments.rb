class CreateEntertainments < ActiveRecord::Migration
  def change
    create_table :entertainments do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
