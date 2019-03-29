class Run < ApplicationRecord

  include HasCarrier
  include HasBookingClass

  monetize :price_cents
  register_currency :eur

  def human_price
    price.format
  end
end
