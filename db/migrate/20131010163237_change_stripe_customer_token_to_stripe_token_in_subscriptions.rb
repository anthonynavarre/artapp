class ChangeStripeCustomerTokenToStripeTokenInSubscriptions < ActiveRecord::Migration
  def change
  	rename_column :subscriptions, :stripe_customer_token, :stripe_token
  end
end
