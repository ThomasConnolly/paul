module Events
  class StripeHandler
    def self.process(event)
      stripe_event = Stripe::Event.construct_from(event.data)

      puts "--------- Stripe Webhook Recieved #{ stripe_event.type }----------"

      case stripe_event.type
      when 'checkout.session.completed'
        checkout_session = stripe_event.data.object
        puts "do this"
      when 'customer.created'
        puts "update user"

        #checkout_session is now the variable that refers to all the data in that particular webhook so we can use checkout_session.customer.id for example
      
        puts "Update pledge with stripe_id"
        sleep(3)
        puts "Update donation with stripe_id"
        sleep(3)

      end
    #def update user
     #   user = User.find(event.metadata.uid)
     #   user.update!(stripe_id: event.customer)
    #end
  end
end