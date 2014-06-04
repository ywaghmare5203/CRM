class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge
  
  validates :user_id, :presence => true
  validates :badge_id, :presence => true
  
  validates_uniqueness_of :badge_id, :scope => :user_id
  
  def self.grant(user_id, badge_id)
    Achievement.create({ user_id: user_id, badge_id: badge_id })
  end
end
