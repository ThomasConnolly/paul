class PurchaseMailer <ActionMailer::Base
  layout 'purchase_mailer'
  default from: "St. Paul's Episcopal Church"

  def purchase_receipt purchase
    @purchase = purchase
    mail to: purchase.email, subject: "Thank you"
  end

end

  