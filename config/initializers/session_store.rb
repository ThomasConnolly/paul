# typed: false
# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

if Rails.env.production?
  Rails.application.config.session_store(:cookie_store, key: '_paul_session',
                                                        same_site: :none, secure: true)
  # else
  #   Rails.application.config.session_store(:cookie_store, key: '_paul_session', same_site: :none)
end
