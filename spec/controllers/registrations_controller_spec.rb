# typed: false
# frozen_string_literal: true

# spec/controllers/registrations_controller_spec.rb
require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'POST #create' do
    before do
      # Mock the Verifalia API response
      allow_any_instance_of(VerifaliaConfig.client.class).to receive(:email_validations).and_return(double(submit: double(entries: [double(classification: 'Undeliverable')])))
    end

    it 'redirects to root path with a flash message for a fake email' do
      post :create,
           params: { user: { email: 'fake@example.com', password: 'password', password_confirmation: 'password' } }

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq('Cannot confirm that email address!')
    end
  end
end

# RSpec.describe RegistrationsController, type: :controller do
#   describe 'POST #create' do
#     context 'with valid params' do
#       let(:valid_attributes) do
#         {
#           user: {
#             email: 'test@example.com',
#             password: 'password',
#             password_confirmation: 'password'
#           }
#         }
#       end

#       it 'creates a new User' do
#         expect do
#           post :create, params: valid_attributes
#         end.to change(User, :count).by(1)
#       end

#       it 'redirects to the home page' do
#         post :create, params: valid_attributes
#         expect(response).to redirect_to(root_path)
#       end
#     end

#     # Add more contexts for invalid params, etc.
#   end
# end
