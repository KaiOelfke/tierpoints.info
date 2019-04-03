class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscribed

  def update

    Stripe::Customer.update(current_user.stripe_id, {
      source: params[:stripeToken]
    })

    current_user.update(
      card_last4: params[:user][:card_last4],
      card_exp_month: params[:user][:card_exp_month],
      card_exp_year: params[:user][:card_exp_year],
      card_brand: params[:user][:card_brand]
    )

    redirect_to subscription_path, notice: 'Successfully updated credit card'
  end

  private

  def check_subscribed
    unless current_user.subscribed?
      redirect_to root_path, notice: "You must be subscribed to update your credit card."
    end
  end

end