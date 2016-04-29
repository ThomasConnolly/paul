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

RSpec.describe PreschoolAsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PreschoolA. As you add validations to PreschoolA, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PreschoolAsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all preschool_as as @preschool_as" do
      preschool_a = PreschoolA.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:preschool_as)).to eq([preschool_a])
    end
  end

  describe "GET #show" do
    it "assigns the requested preschool_a as @preschool_a" do
      preschool_a = PreschoolA.create! valid_attributes
      get :show, {:id => preschool_a.to_param}, valid_session
      expect(assigns(:preschool_a)).to eq(preschool_a)
    end
  end

  describe "GET #new" do
    it "assigns a new preschool_a as @preschool_a" do
      get :new, {}, valid_session
      expect(assigns(:preschool_a)).to be_a_new(PreschoolA)
    end
  end

  describe "GET #edit" do
    it "assigns the requested preschool_a as @preschool_a" do
      preschool_a = PreschoolA.create! valid_attributes
      get :edit, {:id => preschool_a.to_param}, valid_session
      expect(assigns(:preschool_a)).to eq(preschool_a)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PreschoolA" do
        expect {
          post :create, {:preschool_a => valid_attributes}, valid_session
        }.to change(PreschoolA, :count).by(1)
      end

      it "assigns a newly created preschool_a as @preschool_a" do
        post :create, {:preschool_a => valid_attributes}, valid_session
        expect(assigns(:preschool_a)).to be_a(PreschoolA)
        expect(assigns(:preschool_a)).to be_persisted
      end

      it "redirects to the created preschool_a" do
        post :create, {:preschool_a => valid_attributes}, valid_session
        expect(response).to redirect_to(PreschoolA.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved preschool_a as @preschool_a" do
        post :create, {:preschool_a => invalid_attributes}, valid_session
        expect(assigns(:preschool_a)).to be_a_new(PreschoolA)
      end

      it "re-renders the 'new' template" do
        post :create, {:preschool_a => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested preschool_a" do
        preschool_a = PreschoolA.create! valid_attributes
        put :update, {:id => preschool_a.to_param, :preschool_a => new_attributes}, valid_session
        preschool_a.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested preschool_a as @preschool_a" do
        preschool_a = PreschoolA.create! valid_attributes
        put :update, {:id => preschool_a.to_param, :preschool_a => valid_attributes}, valid_session
        expect(assigns(:preschool_a)).to eq(preschool_a)
      end

      it "redirects to the preschool_a" do
        preschool_a = PreschoolA.create! valid_attributes
        put :update, {:id => preschool_a.to_param, :preschool_a => valid_attributes}, valid_session
        expect(response).to redirect_to(preschool_a)
      end
    end

    context "with invalid params" do
      it "assigns the preschool_a as @preschool_a" do
        preschool_a = PreschoolA.create! valid_attributes
        put :update, {:id => preschool_a.to_param, :preschool_a => invalid_attributes}, valid_session
        expect(assigns(:preschool_a)).to eq(preschool_a)
      end

      it "re-renders the 'edit' template" do
        preschool_a = PreschoolA.create! valid_attributes
        put :update, {:id => preschool_a.to_param, :preschool_a => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested preschool_a" do
      preschool_a = PreschoolA.create! valid_attributes
      expect {
        delete :destroy, {:id => preschool_a.to_param}, valid_session
      }.to change(PreschoolA, :count).by(-1)
    end

    it "redirects to the preschool_as list" do
      preschool_a = PreschoolA.create! valid_attributes
      delete :destroy, {:id => preschool_a.to_param}, valid_session
      expect(response).to redirect_to(preschool_as_url)
    end
  end

end
