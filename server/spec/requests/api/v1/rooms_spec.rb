require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Api::V1::Rooms", type: :request do
  before do
    @agent_user = FactoryBot.create(:agent_user)
    @agent_headers = @agent_user.create_new_auth_token
    @agent_headers.store(
      "Content-Type", "application/json"
    )
    @tourist_user = FactoryBot.create(:tourist_user)
    @room_params = {
      title: "sample request",
      token: "tiagoaijiGVFSEFsdafh9r3GDSFsgadsv4a6g",
      poster: @tourist_user.id,
    }
  end

  describe "GET /api/v1/rooms" do
    context "get rooms with valid headers" do
      it "get response with 200 status" do
        post "/api/v1/rooms",
          headers: @agent_headers
        expect(response.status).to eq(200)
      end
    end

    context "create room with invalid headers" do
      it "get response with 401 status" do
        post "/api/v1/rooms",
          headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST /api/v1/rooms" do
    context "create room with valid params" do
      it "get response with 200 status" do
        post "/api/v1/rooms",
          params: @room_params.to_json,
          headers: @agent_headers
        expect(response.status).to eq(200)
      end
    end

    context "create room with title nill params" do
      it "get response with 400 status" do
        title = @room_params["title"]
        @room_params["title"] = nil
        post "/api/v1/rooms",
          params: @room_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @room_params["title"] = title
      end
    end

    context "create room with token nill params" do
      it "get response with 400 status" do
        token = @room_params["token"]
        @room_params["token"] = nil
        post "/api/v1/rooms",
          params: @room_params.to_json,
          headers: @agent_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @room_params["token"] = token
      end
    end

    context "create room with invalid headers" do
      it "get response with 401 status" do
        post "/api/v1/rooms",
          params: @room_params.to_json,
          headers: {}
          expect(response.status).to eq(401)
      end
    end
  end
end
