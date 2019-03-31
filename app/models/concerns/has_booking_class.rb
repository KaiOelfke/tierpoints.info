module HasBookingClass
  extend ActiveSupport::Concern
  included do
    enum booking_class: { economy: 1, premium: 2, business: 3, first: 4 }, _prefix: true
    validates :booking_class, :inclusion => {:in => booking_classes.keys}
    def booking_class_capitalize
      booking_class.capitalize
    end
  end
end