require 'rails_helper'

RSpec.describe "Api::V1::Auth::Users", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @signup_params = {
      name: "test_for_signup",
      email: "test_for_signup@example.com",
      password: "password",
      password_confirmation: "password"
    }
    @params = {
      email: "temp_test_user@example.com",
      password: "password",
    }
    @nonexist_email = {
      email: "nonexist_testuser@example.com",
      password: "password",
    }
    @invalid_password = {
      email: "testuser@example.com",
      password: "invalid_password",
    }
  end

  describe "POST /api/v1/auth" do
    context "sign up with valid params" do
      it "get success response" do
        post "/api/v1/auth", params: @signup_params
        expect(response.status).to eq(200)
      end
    end

    context "sign in with valid params" do
      it "get success response" do
        post "/api/v1/auth/sign_in", params: @params
        expect(response.status).to eq(200)
      end
    end

    context "sign in with invalid params" do
      it "get 401 response with nonexist email" do
        post "/api/v1/auth/sign_in", params: @nonexist_email
        expect(response.status).to eq(401)
      end
      it "get 401 response with invalid password" do
        post "/api/v1/auth/sign_in", params: @invalid_password
        expect(response.status).to eq(401)
      end
    end
  end
end
