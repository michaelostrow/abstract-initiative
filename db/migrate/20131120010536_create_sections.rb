class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
