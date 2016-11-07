class PurchaseMailer <ApplicationMailer
  layout 'purchase_mailer'
  default from: "St. Paul's Episcopal Church"

  def purchase_receipt purchase
    @purchase = purchase
    mail to: purchase.email, subject: "Thank you"
  end

end

  