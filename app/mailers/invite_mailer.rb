class InviteMailer < Devise::Mailer
  default to: Proc.new { Member.pluck(:email, :first_name, :last_name)}

  def invitation_instructions
    @token = token
    devise_mail(record, record.invitation_instructions || :invitation_instructions, opts)
  end
end

