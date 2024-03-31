# frozen_string_literal: true

RSpec.describe RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) do
        {
          user: {
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      it 'creates a new User' do
        expect do
          post :create, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    # Add more contexts for invalid params, etc.
  end
end
