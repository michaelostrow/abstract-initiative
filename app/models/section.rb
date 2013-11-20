class Section < ActiveRecord::Base
  attr_accessible :name, :type, :doer_word, :lead
  
  SUBSECTIONS = {
    "Writing" => "Fiction &bullet; Essays &bullet; Poetry",
    "Visual Arts" => "Painting &bullet; Sketches &bullet; Photography",
    "Video" => "Shorts &bullet; Music Videos",
    "Audio" => "Remixes &bullet; Covers &bullet; Songs"
  }

  def pic
    "/assets/placeholder.png"
  end

  def subsections
    SUBSECTIONS[name].html_safe
  end
  
  def url
    "/section/#{name.to_slug}"
  end

  def artists
    User.with_role name.to_sym
  end

  def banner_image
    "http://placehold.it/900x200"
  end

  def parsed_lead
    RedCloth.new(lead).to_html.html_safe
  end

  ###

  def self.find_by_slug slug
    return where(:name => slug.to_s.gsub("-"," ").titleize).first
  end

end
