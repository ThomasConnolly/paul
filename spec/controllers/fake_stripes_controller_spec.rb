require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe FakeStripesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # FakeStripe. As you add validations to FakeStripe, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FakeStripesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all fake_stripes as @fake_stripes" do
      fake_stripe = FakeStripe.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:fake_stripes)).to eq([fake_stripe])
    end
  end

  describe "GET #show" do
    it "assigns the requested fake_stripe as @fake_stripe" do
      fake_stripe = FakeStripe.create! valid_attributes
      get :show, params: {id: fake_stripe.to_param}, session: valid_session
      expect(assigns(:fake_stripe)).to eq(fake_stripe)
    end
  end

  describe "GET #new" do
    it "assigns a new fake_stripe as @fake_stripe" do
      get :new, params: {}, session: valid_session
      expect(assigns(:fake_stripe)).to be_a_new(FakeStripe)
    end
  end

  describe "GET #edit" do
    it "assigns the requested fake_stripe as @fake_stripe" do
      fake_stripe = FakeStripe.create! valid_attributes
      get :edit, params: {id: fake_stripe.to_param}, session: valid_session
      expect(assigns(:fake_stripe)).to eq(fake_stripe)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FakeStripe" do
        expect {
          post :create, params: {fake_stripe: valid_attributes}, session: valid_session
        }.to change(FakeStripe, :count).by(1)
      end

      it "assigns a newly created fake_stripe as @fake_stripe" do
        post :create, params: {fake_stripe: valid_attributes}, session: valid_session
        expect(assigns(:fake_stripe)).to be_a(FakeStripe)
        expect(assigns(:fake_stripe)).to be_persisted
      end

      it "redirects to the created fake_stripe" do
        post :create, params: {fake_stripe: valid_attributes}, session: valid_session
        expect(response).to redirect_to(FakeStripe.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved fake_stripe as @fake_stripe" do
        post :create, params: {fake_stripe: invalid_attributes}, session: valid_session
        expect(assigns(:fake_stripe)).to be_a_new(FakeStripe)
      end

      it "re-renders the 'new' template" do
        post :create, params: {fake_stripe: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested fake_stripe" do
        fake_stripe = FakeStripe.create! valid_attributes
        put :update, params: {id: fake_stripe.to_param, fake_stripe: new_attributes}, session: valid_session
        fake_stripe.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested fake_stripe as @fake_stripe" do
        fake_stripe = FakeStripe.create! valid_attributes
        put :update, params: {id: fake_stripe.to_param, fake_stripe: valid_attributes}, session: valid_session
        expect(assigns(:fake_stripe)).to eq(fake_stripe)
      end

      it "redirects to the fake_stripe" do
        fake_stripe = FakeStripe.create! valid_attributes
        put :update, params: {id: fake_stripe.to_param, fake_stripe: valid_attributes}, session: valid_session
        expect(response).to redirect_to(fake_stripe)
      end
    end

    context "with invalid params" do
      it "assigns the fake_stripe as @fake_stripe" do
        fake_stripe = FakeStripe.create! valid_attributes
        put :update, params: {id: fake_stripe.to_param, fake_stripe: invalid_attributes}, session: valid_session
        expect(assigns(:fake_stripe)).to eq(fake_stripe)
      end

      it "re-renders the 'edit' template" do
        fake_stripe = FakeStripe.create! valid_attributes
        put :update, params: {id: fake_stripe.to_param, fake_stripe: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested fake_stripe" do
      fake_stripe = FakeStripe.create! valid_attributes
      expect {
        delete :destroy, params: {id: fake_stripe.to_param}, session: valid_session
      }.to change(FakeStripe, :count).by(-1)
    end

    it "redirects to the fake_stripes list" do
      fake_stripe = FakeStripe.create! valid_attributes
      delete :destroy, params: {id: fake_stripe.to_param}, session: valid_session
      expect(response).to redirect_to(fake_stripes_url)
    end
  end

end
