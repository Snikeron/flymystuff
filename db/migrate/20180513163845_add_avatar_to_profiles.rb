class AddAvatarToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :profiles, :avatar
  end

  def self.down
    remove_attachment :profiles, :avatar
  end
end
