class AddThingsToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :content, :text
    add_column :blog_posts, :title, :string
    add_index :blog_posts, :title
  end
end
