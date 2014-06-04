class Entertainment < ActiveRecord::Base
   attr_accessible :music

  has_attached_file :music, 

  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
               :url => "/system/:attachment/:id/:style/:filename"
end
