class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :submitter, :title_slug

  belongs_to :submitter, :class_name => "User"

  after_create :generate_title_slug

  def generate_title_slug
    update_attribute(:title_slug, title.to_slug)
  end
  
  def url
    "/blog/#{created_at.month}/#{created_at.day}/#{title_slug}"
  end

end
