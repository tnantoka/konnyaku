class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :post, index: true
      t.references :lang, index: true
      t.string :title
      t.text :body
      t.text :html
      t.string :tags, array: true

      t.timestamps
    end
  end
end
