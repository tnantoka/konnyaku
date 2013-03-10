class CreateLangs < ActiveRecord::Migration
  def change
    create_table :langs do |t|
      t.string :code

      t.timestamps
    end
  end
end
