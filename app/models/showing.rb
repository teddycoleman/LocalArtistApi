class Showing < ApplicationRecord
  belongs_to :artist, :class_name => 'Profile'
  belongs_to :gallery, :class_name => 'Profile'
  belongs_to :photo
end
