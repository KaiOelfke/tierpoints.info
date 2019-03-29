module HasBookingClass
  extend ActiveSupport::Concern
  included do
    enum booking_class: { economy: 1, premium: 2, business: 3, first: 4 }, _prefix: true
  end
end