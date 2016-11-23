class AddProfilePicToProfile < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :profiles, :profile_pic
  end
end
