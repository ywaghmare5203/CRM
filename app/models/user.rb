
class User < ActiveRecord::Base
  has_many :karaoke_sessions

  # Enable AuthLogic authentication.
  acts_as_authentic do |c|
    # Password reset token will be valid for specified time.
    c.perishable_token_valid_for = 1.hour
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

  attr_accessible :name, :email, :password, :password_confirmation, :terms_and_condition
  
  # These attributes will only be used during user account creation.
  attr_accessor :terms_and_condition
  
  # Validation declaration
  validates :name, :presence => true, :length => { :minimum => 2 }  
  validates :terms_and_condition, :acceptance => true, :on => :create
  
  def sing_count
    self.karaoke_sessions.where(:ended => true).count
  end
end
