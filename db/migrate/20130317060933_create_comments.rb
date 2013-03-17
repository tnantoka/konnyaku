class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.references :lang, index: true
      t.string :author
      t.text :body
      t.text :html

      t.timestamps
    end
  end
end
