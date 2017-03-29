Recaptcha.configure do |config|
  config.public_key  = Rails.application.env.recaptcha_public_key
  config.private_key = Rails.application.env.recaptcha_secret_key
end