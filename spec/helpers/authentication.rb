# frozen_string_literal: true

module Helpers
  module Authentication
    def sign_in_as(_user)
      visit new_user_session_path
      fill_in 'Login', with: ''
      fill_in 'Password', with: ''
      click_on 'Log in'
    end
  end
end
