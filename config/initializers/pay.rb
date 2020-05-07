Pay.setup do |config|
  config.chargeable_class = 'Pay::Charge'
  config.chargeable_table = 'pay_charges'

  # For use in the receipt/refund/renewal mailers
  config.business_name = "St. Paul's Epicopal Church"
  config.business_address = "3701 Davis Blvd."
  config.application_name = "saintpaulsnaples.org"
  config.support_email = "welcome@saintpaulsnaples.org"

  config.send_emails = true

  config.automount_routes = true
  config.routes_path = "/pay" # Only when automount_routes is true
end
