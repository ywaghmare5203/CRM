class CreateKaraokeSessions < ActiveRecord::Migration
  def change
    create_table :karaoke_sessions do |t|
      t.references :user
      t.references :song
      t.column :score, :integer
      t.column :ended, :boolean
      t.timestamps
    end
  end
end
