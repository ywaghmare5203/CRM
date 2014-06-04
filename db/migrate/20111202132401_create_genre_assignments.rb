class CreateGenreAssignments < ActiveRecord::Migration
  def change
    create_table :genre_assignments do |t|
      t.references :artist
      t.references :album
      t.timestamps
    end
  end
end
