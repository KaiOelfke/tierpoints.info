class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :redirect_to_signup, only: [:new]

  def show
  end

  def new
    if !current_user.confirmed?
      redirect_to root_path, notice: "Please confirm your email address before subscribing."
    end

    if current_user.subscribed?
      redirect_to root_path, notice: "You are already a subscriber"
    end
  end

  def create

    plan_id = params[:plan_id]
    plan = Stripe::Plan.retrieve(plan_id)
    token = params[:stripeToken]

    unless params[:stripeToken]
      return redirect_to subscription_path, flash: { error: 'No card data from Stripe. Please contact customer support.' }
    end

    customer = if current_user.stripe_id?
                Stripe::Customer.retrieve(current_user.stripe_id)
               else
                Stripe::Customer.create(email: current_user.email, source: token)
              end

    if current_user.stripe_id? && customer.default_source != token 
      Stripe::Customer.update(current_user.stripe_id, {source: token})
    end

    subscription = customer.subscriptions.create(plan: plan.id)

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
      subscribed: true,
      payment_plan: params[:plan]
    }

    options.merge!(
      card_last4: params[:user][:card_last4],
      card_exp_month: params[:user][:card_exp_month],
      card_exp_year: params[:user][:card_exp_year],
      card_brand: params[:user][:card_brand]
    ) if params[:user][:card_last4]

    options.merge!(
      free_refund_expiration_time: DateTime.now + 31.days
    ) if !current_user.free_refund_expiration_time

    current_user.update(options)

    redirect_to root_path, notice: "Thank you for subscribing."
  end

  def destroy
    if current_user.refundable?
      charges = Stripe::Charge.list(
        customer: current_user.stripe_id,
        created: { gte: (current_user.free_refund_expiration_time - 32.days).to_i }
      )
      unless charges.count == 1 
        redirect_to root_path, flash: { error: "We're sorry. The refund was not successful. Please contact customer support." } 
      end
      charge = charges.first
      Stripe::Refund.create({charge: charge.id})
      Stripe::Subscription.retrieve(current_user.stripe_subscription_id).delete
      current_user.update(stripe_subscription_id: nil, subscribed: false)
      current_user.free_refund_expiration_time = Time.at(0)
      redirect_to root_path, notice: "Your subscription has been refunded."
    else 
      Stripe::Subscription.retrieve(current_user.stripe_subscription_id).delete
      current_user.update(stripe_subscription_id: nil, subscribed: false)
      redirect_to root_path, notice: "Your subscription has been cancelled."
    end
  
  end

  private

  def redirect_to_signup
    if !user_signed_in?
      store_location_for(:user, new_subscription_path)
      redirect_to new_user_registration_path
    end
  end
end
