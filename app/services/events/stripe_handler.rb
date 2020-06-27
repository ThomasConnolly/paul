module Events
  class StripeHandler
    def self.process(event)
      stripe_event = Stripe::Event.construct_from(event.data)

      case stripe_event.type
      when 'checkout.session.completed'
        checkout_session = stripe_event.data.object

        #checkout_session is now the variable that refers to all the data in that particular webhook so we can use +checkout_session.customer.id for example
      end

      def update_records
        user = User.find_by(stripe_id: checkout_session.customer)
        case checkout_session.mode 
        when 'subscription'
          pledge = Pledge.find(user.pledge.id)
          pledge.update!(stripe_id: checkout_session.subscription)
        when 'payment'
          donation = Donation.where(user: user.id).last
          donation.update!(
            stripe_id: checkout_session.payment_intent,
            status: 1
          )
        end
      end
    end
  end
end
