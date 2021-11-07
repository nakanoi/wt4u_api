require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Api::V1::Messages", type: :request do
  before do
    @agent_user = FactoryBot.create(:agent_user)
    @agent_headers = @agent_user.create_new_auth_token
    @agent_headers.store(
      "Content-Type", "application/json"
    )
    @room = FactoryBot.create(:room)
    @message_params = {
      context: "Hello first message.",
      room_id: @room.id,
    }
  end

  describe "GET /api/v1/messages" do
    context "get messages with valid headers" do
      it "get response with 200 status" do
        get '/api/v1/messages',
          headers: @agent_headers
        expect(response.status).to eq(200)
      end
    end

    context "get messages with invalid headers" do
      it "get response with 401 status" do
        get '/api/v1/messages',
          headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST /api/v1/messages" do
    context "psot messages with valid params" do
      it "get response with 200 status" do
        post '/api/v1/messages',
          params: @message_params.to_json,
          headers: @agent_headers
        expect(response.status).to eq(200)
      end
    end

    context "psot messages with nil context params" do
      it "get response with 400 status" do
        context = @message_params["context"]
        @message_params["context"] = nil
        post '/api/v1/messages',
          params: @message_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @message_params["context"] = context
      end
    end

    context "psot messages with invalid headers" do
      it "get response with 401 status" do
        post '/api/v1/messages',
          params: @message_params.to_json,
          headers: {}
        expect(response.status).to eq(401)
      end
    end
  end
end
