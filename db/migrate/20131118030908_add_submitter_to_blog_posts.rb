class AddSubmitterToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :submitter_id, :int
  end
end
