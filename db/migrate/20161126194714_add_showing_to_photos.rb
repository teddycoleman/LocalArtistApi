class AddShowingToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :showing, foreign_key: true
  end
end
