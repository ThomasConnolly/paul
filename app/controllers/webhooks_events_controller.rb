# class WebhooksController < StripeEvent::WebhookController
#   skip_before_action :verify_authenticity_token

#   def create
#     if !valid_signatures?
#       render json: { message: "Invalid sigs" }, status: 400
#       return
#     end
#     if !WebhookEvent.find_by(source: params[:source], 
#       external_id: external_id).nil?
#       render json: { message: "Already processd #{ external_id }"}
#       return
#     end

#     event = WebhookEvent.create(webhook_params)  
#     case params[:source]
#     when 'stripe'
#       case params[:type]
#       when 'checkout.session.completed'
#         puts "send customer email"
#         puts "send accountant email"
#       end
#     when 'github'
#     end
#     render json: params
#     end
    
#     def valid_signatures?
#       if params[:source] == 'stripe'
#         begin
#           wh_secret = Rails.application.credentials.dig(:stripe, :wh)
#           Stripe::Webhook.construct_event(
#             request.body.read,
#             request.env['HTTP_STRIPE_SIGNATURE'],
#             wh_secret
#           )
#         rescue Stripe::SignatureVerificationError => e
#           return false
#         end
#       end

#       true
#     end
#     def external_id
#       return params[:id] if params[:source] == 'stripe'
#       SecureRandom.hex
#     end

#     def webhook_params
#       {
#         source: params[:source],
#         data: params.except(:source, :action, :controller).permit!,
#         external_id: external_id
#       }
#     end
#   end
