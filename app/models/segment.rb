class Segment < ApplicationRecord
  has_many :run_segments, :dependent => :destroy, inverse_of: :segment
  has_many :runs, through: :run_segments
  include HasCarrier
  include HasBookingClass
  accepts_nested_attributes_for :runs
end
