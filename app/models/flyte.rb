class Flyte < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  
  def price_in_dollars
    payment_amount.to_f / 100.00
  end

end
