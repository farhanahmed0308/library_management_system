class CheckoutsController < ApplicationController
    include ActionView::Helpers::NumberHelper
    def create
        # byebug
        @user = current_user
        total_balance = @user.balance
        balance = total_balance * 100
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                price_data: {
                    currency: 'usd', 
                    unit_amount: balance,
                    product_data: {
                        name: @user.email,
                    }
                },
                quantity: 1
            }],
            mode: 'payment',
            success_url: pages_success_stripe_url,
            cancel_url: root_url,
        })
        respond_to do |format|
            format.html
        end
    end 
end