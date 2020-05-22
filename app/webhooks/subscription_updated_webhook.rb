# class SubscriptionUpdatedWebhook
#   def call(event)
#     object = event.data.object
#     subscription = Subscription.find_by(stripe_id: object.id)
#     return if subscription.nil?

#     if object.status == "incomplete_expired"
#       subscription.destroy
#       return
#     end

#     subscription.status = object.status    
#   end

#     susbscription.save
  
# end
