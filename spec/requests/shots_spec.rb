 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/shots", type: :request do
  
  # Shot. As you add validations to Shot, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Shot.create! valid_attributes
      get shots_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      shot = Shot.create! valid_attributes
      get shot_url(shot)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_shot_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      shot = Shot.create! valid_attributes
      get edit_shot_url(shot)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Shot" do
        expect {
          post shots_url, params: { shot: valid_attributes }
        }.to change(Shot, :count).by(1)
      end

      it "redirects to the created shot" do
        post shots_url, params: { shot: valid_attributes }
        expect(response).to redirect_to(shot_url(Shot.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Shot" do
        expect {
          post shots_url, params: { shot: invalid_attributes }
        }.to change(Shot, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post shots_url, params: { shot: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested shot" do
        shot = Shot.create! valid_attributes
        patch shot_url(shot), params: { shot: new_attributes }
        shot.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the shot" do
        shot = Shot.create! valid_attributes
        patch shot_url(shot), params: { shot: new_attributes }
        shot.reload
        expect(response).to redirect_to(shot_url(shot))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        shot = Shot.create! valid_attributes
        patch shot_url(shot), params: { shot: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested shot" do
      shot = Shot.create! valid_attributes
      expect {
        delete shot_url(shot)
      }.to change(Shot, :count).by(-1)
    end

    it "redirects to the shots list" do
      shot = Shot.create! valid_attributes
      delete shot_url(shot)
      expect(response).to redirect_to(shots_url)
    end
  end
end
