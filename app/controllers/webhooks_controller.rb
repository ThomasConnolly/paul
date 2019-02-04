class WebhooksController < StripeEvent::WebhookController
  skip_before_action :verify_authenticity_token
end
