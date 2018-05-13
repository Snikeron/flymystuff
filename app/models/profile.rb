class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  validates(
    :first_name,
    :last_name,
    :shopper_flytes,
    :flyer_flytes,
    presence: true 
  )

  def full_name
    "#{first_name} #{last_name}"
  end
end
