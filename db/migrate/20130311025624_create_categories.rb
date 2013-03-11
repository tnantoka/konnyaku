class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.hstore :names
      t.string :slug

      t.timestamps
    end
  end
end
