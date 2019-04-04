class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  validates_presence_of :free_refund_expiration_time, :if => :stripe_id?

  def subscribed?
    stripe_subscription_id?
  end

  def refundable?
    subscribed? && free_refund_expiration_time > Time.zone.today
  end
end
