class Badge < ActiveRecord::Base
  validates :name, :presence => true
  validates :category, :presence => true
  validates :description, :presence => true
  validates :required_value, :presence => true, :numericality => true
end
