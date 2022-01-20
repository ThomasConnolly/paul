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
              stripe_report = StripeReport.create(amount: pledge.amount, pledge_id: pledge.id,user_id: user.id)
              StripeMailer.report_created(stripe_report).deliver_later
                
            when 'payment'
              if checkout_session.client_reference_id[0..2]=="tic"
                ticket = Ticket.find(checkout_session.client_reference_id[4..-1].to_i)
                ticket.update!(checkout: checkout_session.payment_status)
              else
                donation = Donation.find(checkout_session.metadata.donation_id)
                donation.update!(status: checkout_session.payment_status)
              end
              
              stripe_report = StripeReport.create(amount: donation.amount, donation_id: donation.id, user_id: user.id)
              StripeMailer.report_created(stripe_report).deliver_later
          end

      when 'invoice.paid'
        pledge_payment = stripe_event.data.object
        user = User.find_by(stripe_id: pledge_payment.customer)
        stripe_report = StripeReport.create(user_id: user.id, amount: pledge_payment.amount_paid, pledge_id: user.pledge.id )
        StripeMailer.report_created(stripe_report).deliver_later
      end
    end
  end
end
