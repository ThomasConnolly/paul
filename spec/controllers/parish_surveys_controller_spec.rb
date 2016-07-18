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

RSpec.describe ParishSurveysController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ParishSurvey. As you add validations to ParishSurvey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ParishSurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all parish_surveys as @parish_surveys" do
      parish_survey = ParishSurvey.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:parish_surveys)).to eq([parish_survey])
    end
  end

  describe "GET #show" do
    it "assigns the requested parish_survey as @parish_survey" do
      parish_survey = ParishSurvey.create! valid_attributes
      get :show, params: {id: parish_survey.to_param}, session: valid_session
      expect(assigns(:parish_survey)).to eq(parish_survey)
    end
  end

  describe "GET #new" do
    it "assigns a new parish_survey as @parish_survey" do
      get :new, params: {}, session: valid_session
      expect(assigns(:parish_survey)).to be_a_new(ParishSurvey)
    end
  end

  describe "GET #edit" do
    it "assigns the requested parish_survey as @parish_survey" do
      parish_survey = ParishSurvey.create! valid_attributes
      get :edit, params: {id: parish_survey.to_param}, session: valid_session
      expect(assigns(:parish_survey)).to eq(parish_survey)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ParishSurvey" do
        expect {
          post :create, params: {parish_survey: valid_attributes}, session: valid_session
        }.to change(ParishSurvey, :count).by(1)
      end

      it "assigns a newly created parish_survey as @parish_survey" do
        post :create, params: {parish_survey: valid_attributes}, session: valid_session
        expect(assigns(:parish_survey)).to be_a(ParishSurvey)
        expect(assigns(:parish_survey)).to be_persisted
      end

      it "redirects to the created parish_survey" do
        post :create, params: {parish_survey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ParishSurvey.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved parish_survey as @parish_survey" do
        post :create, params: {parish_survey: invalid_attributes}, session: valid_session
        expect(assigns(:parish_survey)).to be_a_new(ParishSurvey)
      end

      it "re-renders the 'new' template" do
        post :create, params: {parish_survey: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested parish_survey" do
        parish_survey = ParishSurvey.create! valid_attributes
        put :update, params: {id: parish_survey.to_param, parish_survey: new_attributes}, session: valid_session
        parish_survey.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested parish_survey as @parish_survey" do
        parish_survey = ParishSurvey.create! valid_attributes
        put :update, params: {id: parish_survey.to_param, parish_survey: valid_attributes}, session: valid_session
        expect(assigns(:parish_survey)).to eq(parish_survey)
      end

      it "redirects to the parish_survey" do
        parish_survey = ParishSurvey.create! valid_attributes
        put :update, params: {id: parish_survey.to_param, parish_survey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(parish_survey)
      end
    end

    context "with invalid params" do
      it "assigns the parish_survey as @parish_survey" do
        parish_survey = ParishSurvey.create! valid_attributes
        put :update, params: {id: parish_survey.to_param, parish_survey: invalid_attributes}, session: valid_session
        expect(assigns(:parish_survey)).to eq(parish_survey)
      end

      it "re-renders the 'edit' template" do
        parish_survey = ParishSurvey.create! valid_attributes
        put :update, params: {id: parish_survey.to_param, parish_survey: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested parish_survey" do
      parish_survey = ParishSurvey.create! valid_attributes
      expect {
        delete :destroy, params: {id: parish_survey.to_param}, session: valid_session
      }.to change(ParishSurvey, :count).by(-1)
    end

    it "redirects to the parish_surveys list" do
      parish_survey = ParishSurvey.create! valid_attributes
      delete :destroy, params: {id: parish_survey.to_param}, session: valid_session
      expect(response).to redirect_to(parish_surveys_url)
    end
  end

end
