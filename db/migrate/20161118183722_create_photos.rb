class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :profile, foreign_key: true
      t.integer :price
      t.string :description
      t.integer :order

      t.timestamps
    end
  end
end
