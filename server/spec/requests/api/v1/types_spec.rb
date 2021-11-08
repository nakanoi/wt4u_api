require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Api::V1::Types", type: :request do
  before do
    @tourist = FactoryBot.create(:tourist_user)
    @tourist_headers = @tourist.create_new_auth_token
    @tourist_headers.store(
      "Content-Type", "application/json"
    )

    @agent = FactoryBot.create(:agent_user)
    @agent_headers = @agent.create_new_auth_token
    @agent_headers.store(
      "Content-Type", "application/json"
    )
  end

  describe "POST /api/v1/types" do
    context "post tourist with valid params" do
      it "get response with 200 status" do
        valid_tourist_params =  {
          type: "tourist",
        }
        post "/api/v1/types",
          params: valid_tourist_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(200)
      end
    end

    context "post agent with valid params" do
      it "get response with 200 status" do
        valid_agent_params =  {
          type: "agent",
        }
        post "/api/v1/types",
          params: valid_agent_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(200)
      end
    end

    context "post nil type params" do
      it "get response with 200 status" do
        valid_agent_params =  {
          type: nil,
        }
        post "/api/v1/types",
          params: valid_agent_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
      end
    end

    context "post with invalid headers" do
      it "get response with 401 status" do
        valid_params =  {
          type: "agent",
        }
        post "/api/v1/types",
          params: valid_params.to_json,
          headers: @agent_headers.slice("access-token")
        expect(response.status).to eq(401)
      end
    end
  end
end
