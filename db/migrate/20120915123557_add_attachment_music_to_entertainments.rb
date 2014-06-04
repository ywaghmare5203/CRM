class AddAttachmentMusicToEntertainments < ActiveRecord::Migration
  def self.up
    change_table :entertainments do |t|
      t.has_attached_file :music
    end
  end

  def self.down
    drop_attached_file :entertainments, :music
  end
end
