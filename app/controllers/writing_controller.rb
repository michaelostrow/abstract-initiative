class WritingController < ApplicationController

  def index
    @writers = User.writers
  end
  
end
