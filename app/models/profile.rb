class Profile < ApplicationRecord
	has_many :photos
	has_many :gallery_showings, :class_name => 'Showing', :foreign_key => 'gallery_id'
	has_many :artist_showings, :class_name => 'Showing', :foreign_key => 'artist_id'
	validates :name, :style, :profile_type, :description, presence: true

	def get_showings
		self.profile_type === "artist" ? self.artist_showings : self.gallery_showings
	end
end
