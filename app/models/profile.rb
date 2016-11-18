class Profile < ApplicationRecord
	has_many :photos
	has_many :gallery_showings, :class_name => 'Showing', :foreign_key => 'gallery_id'
	has_many :artist_showings, :class_name => 'Showing', :foreign_key => 'artist_id'
end
