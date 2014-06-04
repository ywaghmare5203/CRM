class KaraokeSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  
  validates :user_id, :presence => true
  validates :song_id, :presence => true
  
  validates_presence_of :score, :if => :ended?
  
  def self.start(user_id, song_id)
    KaraokeSession.create!({ user_id: user_id, song_id: song_id })
  end
  
  def finalize!
    self.ended = true
    begin
      self.save!
    rescue
      self.ended = false
      raise
    end
  end
  
  def ended?
    (self.ended == true) || false
  end
end
