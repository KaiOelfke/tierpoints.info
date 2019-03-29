require "administrate/base_dashboard"

class SegmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    runs: Field::HasMany,
    id: Field::Number,
    departure_airport: Field::String,
    arrival_airport: Field::String,
    carrier: Field::Enum,
    booking_class: Field::Enum,
    tp: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :runs,
    :departure_airport,
    :arrival_airport,
    :carrier,
    :booking_class,
    :tp
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :runs,
    :id,
    :departure_airport,
    :arrival_airport,
    :carrier,
    :booking_class,
    :tp,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :departure_airport,
    :arrival_airport,
    :carrier,
    :booking_class,
    :tp,
  ].freeze

  # Overwrite this method to customize how segments are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(segment)
    "#{segment.carrier}:#{segment.departure_airport}-#{segment.arrival_airport}-#{segment.booking_class}"
  end
end
