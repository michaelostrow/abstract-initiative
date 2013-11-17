class User < ActiveRecord::Base
  require 'extensions'

  after_create :set_last_sign_in_at_to_created_at

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # NOTE: Disable confirming module for now!!!

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # Needed for facebook oauth
  attr_accessible :provider, :uid, :name

  
  # Data we'll scrape from facebook
  attr_accessible :first_name, :last_name, :url_slug, :gender, :prof_pic, :facebook_link, :location, :hometown, :bio  

  validates :name, :presence => true
  
  def active_for_authentication?
    true
  end
  
  def profile_pic
    prof_pic or "/assets/profile-placeholder.png"
  end

  def trades
    roles.dup.delete_if do |r|
      r.name == 'admin' or /mod/.match(r.name)
    end
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

  ##############################
  # OmniAuth Methods
  ##############################

  def set_last_sign_in_at_to_created_at
    update_attributes({:last_sign_in_at => created_at})
  end

  def apply_omniauth(auth)
    require 'open-uri'
    
    self.uid = auth['uid']
    self.email = auth['extra']['raw_info']['email']
    [:location, :hometown].each do |field|
      begin
        assign_attributes({
          field => auth['extra']['raw_info'][field.to_s]['name']
        })
      rescue
        assign_attributes({
          field => ""
        })
      end
    end
    begin
      self.gender = auth['extra']['raw_info']['gender']
    rescue
      self.gender = "Unspecified"
    end
    self.first_name = auth['extra']['raw_info']['first_name']
    self.last_name = auth['extra']['raw_info']['last_name']
    self.name = "#{self.first_name} #{self.last_name}"
    self.facebook_link = auth['extra']['raw_info']['link']
    self.prof_pic = open("http://graph.facebook.com/#{auth['uid']}/picture?type=large&height=400&redirect=false"){|s| JSON.parse(s.readlines.first)['data']['url']}
    #self.first_login = true
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    self.provider = auth['provider']
    self.uid = auth['uid']
    self.token = auth['credentials']['token']
    create_slug
  end

  def safe_slug
    return url_slug.to_slug unless url_slug.nil?
    return id
  end

  def create_slug
    @url_slug = (/\/[\w.]*?$/.match facebook_link).to_s.gsub(/^\//,"")
    if @url_slug.empty?
      @url_slug = name
    end
    self.url_slug = @url_slug.to_slug
  end

  def profile_pic
    prof_pic or "/assets/profile-photo-placeholder.jpg"
  end

  def url
    "/user/#{safe_slug}"
  end
    
  def edit_url
    url + "/edit"
  end

  def to_s
    "<# '#{name}'>"
  end
  
  def slugify_slug
    new_url_slug = url_slug.to_slug
    update_attribute(
                     :url_slug, new_url_slug
                     )
  end
  
end
