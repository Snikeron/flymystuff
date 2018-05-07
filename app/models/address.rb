class Address < ApplicationRecord
  belongs_to :user

  validates(
    :street_address,
    :city,
    :state,
    :postcode,
    :country_code,
    presence: true 
  )

  def full_address
    "#{street_address}, #{city}, #{state}, #{postcode}, #{country_code}"
  end
end
