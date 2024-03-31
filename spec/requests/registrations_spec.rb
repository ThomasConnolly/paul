# frozen_string_literal: true

# spec/requests/registrations_spec.rb

require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /create' do
    it 'rejects invalid email addresses' do
      post user_registration_path, params: { user: attributes_for(:user, email: 'invalid') }
      expect(response).to redirect_to(new_user_registration_path)
      expect(flash[:alert]).to eq('Invalid email address')
    end
  end
end
