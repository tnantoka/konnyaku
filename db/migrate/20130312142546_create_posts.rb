class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :category, index: true
      t.string :slug

      t.timestamps
    end
  end
end
