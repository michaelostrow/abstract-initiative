# -*- coding: utf-8 -*-
String.class_eval do

  def transliterate
    # Unidecode gem is missing some hyphen transliterations
    self.gsub(/[-‐‒—―⁃−­]/, '-').to_ascii
  end
  def to_slug
    self.transliterate.downcase.gsub(/[^a-z0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
  end
  def sanitize_as_filename
    self.gsub(/^.*(\\|\/)/, '').transliterate.downcase.gsub(/[^a-z0-9\. ]/, ' ').strip.gsub(/[ ]+/, '-')
  end
end
