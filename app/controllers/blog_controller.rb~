class BlogController < ApplicationController

  def new
    @post = BlogPost.new
  end

  def create
    @post = current_user.blog_posts.build(params[:blog_post])
    if @post.save
      flash[:notice] = "Posted '#{@post.title}'."
      redirect_to "show"
    else
      flash[:alert] = "There were some errors."
      redirect_to "edit"
    end
  end

  def index
    @posts = BlogPost.all
  end


  def show
    @post = BlogPost.where("strftime('%m', created_at) = ? and strftime('%d', created_at) = ? and title_slug = ?", params["month"], params["day"], params["title_slug"]).first
  end

end
