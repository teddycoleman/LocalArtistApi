class Photo < ApplicationRecord
  belongs_to :profile
  belongs_to :showing, optional: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def photo_url
      photo.url(:medium)
  end
end
