class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find_by_slug(params[:section_slug])
    @fancy_action_name = @section.name
  end
  
end
