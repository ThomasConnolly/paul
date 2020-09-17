module Events
  class StripeHandler
    def self.process(event)
      stripe_event = Stripe::Event.construct_from(event.data)

      case stripe_event.type
      when 'checkout.session.completed'
        checkout_session = stripe_event.data.object

        #checkout_session is now the variable that refers to all the data in that particular webhook so we can use checkout_session.customer.id for example.

        user = User.find_by(stripe_id: checkout_session.customer)
          case checkout_session.mode 
            when 'subscription'
              pledge = user.pledge
              pledge.update!(stripe_id: checkout_session.subscription)
                StripeReport.create(amount: pledge.amount, pledge_id: pledge.id,user_id: user.id, date: pledge.created_at)
            when 'payment'
              donation = Donation.find(checkout_session.client_reference_id)
              donation.update!(
                stripe_id: checkout_session.payment_intent,
                status: 1
              )
              StripeReport.create(amount: donation.amount, donation_id: donation.id, user_id: user.id, date: donation.created_at)
          end

      when 'invoice.payment_succeeded'
        
        pledge_payment = stripe_event.data.object
        user = User.find_by(stripe_id: pledge_payment.customer)
        
        StripeReport.create(user_id: user.id, amount: pledge_payment.amount_paid, pledge_id: user.pledge.id, edate: pledge_payment.created )
      end
    end
  end
end
