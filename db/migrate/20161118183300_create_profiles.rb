class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :style
      t.string :profile_type
      t.string :description

      t.timestamps
    end
  end
end
