class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify


  def self.all_except_admin
    all.dup.delete_if do |r| r.name == "admin" end
  end

  def self.arts
    all.dup.delete_if do |r| r.name == "admin" or /mod/.match r.name end
  end


end
