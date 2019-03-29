class Run < ApplicationRecord

  include HasCarrier

  monetize :price_cents
  register_currency :eur

  has_many :run_segments, -> { order(position: :asc) }, :dependent => :destroy, inverse_of: :run
  has_many :segments, through: :run_segments
  accepts_nested_attributes_for :segments

  def human_price
    price.format
  end
end
