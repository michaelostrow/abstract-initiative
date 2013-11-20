class AddDoerWordToSections < ActiveRecord::Migration
  def change
    add_column :sections, :doer_word, :string
  end
end
