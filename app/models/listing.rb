class Listing < ApplicationRecord
  belongs_to :user

  def self.listing_created_by id
    Profile.find_by(user_id: id).full_name
  end
end
