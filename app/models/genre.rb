class Genre < ActiveRecord::Base
  has_many :genre_assignments
  has_many :songs, :through => :genre_assignments
end
