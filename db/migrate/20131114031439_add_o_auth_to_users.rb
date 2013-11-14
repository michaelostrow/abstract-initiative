class AddOAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :url_slug, :string
    add_column :users, :gender, :string
    add_column :users, :facebook_link, :string
    add_column :users, :location, :string
    add_column :users, :hometown, :string
  end
end
