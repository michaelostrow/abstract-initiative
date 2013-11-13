class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name, :presence => true
  
  def active_for_authentication?
    false
  end
  
  def profile_pic
    prof_pic or "/assets/profile-placeholder.png"
  end

  def to_s
    "<#User: #{name}>"
  end


  ##############################
  #  Class methods
  ##############################
  
  def self.admins
    return with_role :admin
  end

  def self.writers
    return with_role :writing
  end

  def self.visual_artists
    return with_role :visual_art      
  end

  def self.multimedia_artists
    return with_role :multimedia
  end

  def self.musicians
    return with_role :music
  end

end
