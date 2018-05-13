class Listing < ApplicationRecord
  belongs_to :user
  has_many :responses
  has_one :flyte

  def self.listing_created_by id
    Profile.find_by(user_id: id).full_name
  end
end
