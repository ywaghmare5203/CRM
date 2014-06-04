class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name

    end
  end
end
