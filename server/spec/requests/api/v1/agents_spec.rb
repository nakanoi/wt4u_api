require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Api::V1::Agents", type: :request do
  before do
    @agent_user = FactoryBot.create(:agent_user)
    @agent_type = FactoryBot.create(
      :type_agent,
      user: @agent_user
    )
    @agent_headers = @agent_user.create_new_auth_token
    @agent_headers.store(
      "Content-Type", "application/json"
    )
  end

  describe "POST /api/v1/agents" do
    context "create agents with valid params" do
      it "successfully done" do
        valid_params = {
          area: "札幌",
          business: "宿泊"
        }
        post "/api/v1/agents",
          params: valid_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(200)
      end
    end

    context "create agents with nil area" do
      it "get 400 response" do
        valid_params = {
          area: nil,
          business: "宿泊",
        }
        post "/api/v1/agents",
          params: valid_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
      end
    end

    context "create agents with nil area" do
      it "get 400 response" do
        valid_params = {
          area: "札幌",
          business: nil,
        }
        post "/api/v1/agents",
          params: valid_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
      end
    end

    context "create agents with invalid headers" do
      it "get 401 response" do
        valid_params = {
          area: "札幌",
          business: "宿泊",
        }
        post "/api/v1/agents",
          params: valid_params.to_json,
          headers: {}
        expect(response.status).to eq(401)
      end
    end
  end
end
