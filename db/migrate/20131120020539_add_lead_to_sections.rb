class AddLeadToSections < ActiveRecord::Migration
  def change
    add_column :sections, :lead, :text
  end
end
