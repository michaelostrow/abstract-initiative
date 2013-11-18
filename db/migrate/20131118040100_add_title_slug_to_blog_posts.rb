class AddTitleSlugToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :title_slug, :string
  end
end
