class Run < ApplicationRecord

  include HasCarrier
  include HasBookingClass

  monetize :price_cents, numericality: { greater_than_or_equal_to: 1 }
  register_currency :eur

  validates :departure_airport, length: { is: 3 }
  validates :arrival_airport, length: { is: 3 }
  validates :tp, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
  validates :price_tp_ratio, numericality: { only_float: true, greater_than_or_equal_to: 0 }

  before_validation :compute_price_tp_ratio

  def expired?
    expire_date? && expire_date <= Time.zone.today
  end

  def human_price
    price.format
  end

  def human_expire_date
    if expire_date?
      expire_date.strftime("%Y-%m-%d")
    else
      "No date set."
    end
  end

  def departure_airport=(s)
    write_attribute(:departure_airport, s.to_s.upcase)
  end

  def arrival_airport=(s)
    write_attribute(:arrival_airport, s.to_s.upcase)
  end

  def tp=(val)
    super(val)
    compute_price_tp_ratio if price_cents and tp
  end

  def price_cents=(val)
    super(val)
    compute_price_tp_ratio if price_cents and tp
  end

  private

  def compute_price_tp_ratio
    self.price_tp_ratio = (price_cents.fdiv(tp) / 100).round(2)
  end

end
