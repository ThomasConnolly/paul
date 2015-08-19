# Preview all emails at http://localhost:3000/rails/mailers/email
class EmailPreview < ActionMailer::Preview
   def email_preview
    Email.email(User.first)
  end
end
