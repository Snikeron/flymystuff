class Profile < ApplicationRecord
  belongs_to :user

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
