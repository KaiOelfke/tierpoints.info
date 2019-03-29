require "administrate/base_dashboard"


class RunDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    departure_airport: Field::String,
    arrival_airport: Field::String,
    carrier: Field::Enum,
    expired: Field::Boolean,
    tp: Field::Number,
    booking_class: Field::Enum,
    price_cents: Field::Number,
    price_tp_ratio: Field::Number.with_options(decimals: 2),
    itinerary: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :departure_airport,
    :arrival_airport,
    :carrier,
    :tp,
    :booking_class,
    :price_tp_ratio,
    :price_cents,
    :expired,
    :itinerary,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :departure_airport,
    :arrival_airport,
    :carrier,
    :expired,
    :tp,
    :booking_class,
    :price_cents,
    :price_tp_ratio,
    :itinerary,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :departure_airport,
    :arrival_airport,
    :carrier,
    :expired,
    :tp,
    :booking_class,
    :price_cents,
    :price_tp_ratio,
    :itinerary,
  ].freeze

  # Overwrite this method to customize how runs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(run)
  #   "Run ##{run.id}"
  # end
end
