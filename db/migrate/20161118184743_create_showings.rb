class CreateShowings < ActiveRecord::Migration[5.0]
  def change
    create_table :showings do |t|
      t.references :artist
      t.references :gallery
      t.string :description

      t.timestamps
    end
  end
end
