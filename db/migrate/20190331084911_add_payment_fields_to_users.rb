class AddPaymentFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :card_brand, :string
    add_column :users, :card_exp_month, :string
    add_column :users, :card_exp_year, :string
    add_column :users, :card_last4, :string
    add_column :users, :subscribed, :boolean
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :payment_plan, :string
    add_column :users, :free_refund_expiration_time, :datetime
  end
end
