class AdditemPhotoToListings < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :listings, :item_photo
  end

  def self.down
    remove_attachment :listings, :item_photo
  end
end
