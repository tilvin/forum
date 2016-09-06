require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before :each do
    @user = create(:user)
    @question = create(:question, user: @user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "creates a new question" do
      post :create, question: attributes_for(:question), format: :js
      expect(response).to have_http_status(:success)
      expect(Question.count).to eq(2)
    end
  end

  describe "DELETE #destroy" do
    it "destroy question" do
      expect{ delete :destroy, id: @question.id}.to change(Question,:count).by(0)
    end
  end
end

