class Listing < ApplicationRecord
  belongs_to :user
  has_many :responses
  has_one :flyte
  has_attached_file :item_photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :item_photo, :content_type => /\Aimage\/.*\Z/

  def self.listing_created_by id
    Profile.find_by(user_id: id).full_name
  end
end
