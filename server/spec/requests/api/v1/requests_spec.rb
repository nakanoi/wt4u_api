require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Api::V1::Requests", type: :request do
  before do
    @tourist_user = FactoryBot.create(:tourist_user)
    @tourist_headers = @tourist_user.create_new_auth_token
    @tourist_headers.store(
      "Content-Type", "application/json"
    )
    @request_params = {
      title: "Sample Request from Tourist",
      area: "札幌",
      cost: 50000,
      number: 2,
      date: "2022-8-20",
      days: 2,
      genre: "自然観光",
      range: 50,
      context: "This is just a sample post.",
    }
  end

  describe "GET /api/v1/requests" do
    context "get requests with valid headers" do
      it "get response with 200 status" do
        get "/api/v1/requests",
          headers: @tourist_headers
        expect(response.status).to eq(200)
      end
    end

    context "get requests with invalid headers" do
      it "get response with 200 status" do
        get "/api/v1/requests", headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST /api/v1/requests" do
    context "create request with valid params" do
      it "get response with 200 status" do
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(response.status).to eq(200)
      end
    end

    context "create request with nil title" do
      it "get response with 400 status" do
        title = @request_params["title"]
        @request_params["title"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["title"] = title
      end
    end

    context "create request with nil area" do
      it "get response with 400 status" do
        area = @request_params["area"]
        @request_params["area"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["area"] = area
      end
    end

    context "create request with nil cost" do
      it "get response with 400 status" do
        cost = @request_params["cost"]
        @request_params["cost"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["cost"] = cost
      end
    end

    context "create request with nil number" do
      it "get response with 400 status" do
        number = @request_params["number"]
        @request_params["number"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["number"] = number
      end
    end

    context "create request with nil date" do
      it "get response with 400 status" do
        date = @request_params["date"]
        @request_params["date"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["date"] = date
      end
    end

    context "create request with nil days" do
      it "get response with 400 status" do
        days = @request_params["days"]
        @request_params["days"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["days"] = days
      end
    end

    context "create request with nil genre" do
      it "get response with 400 status" do
        genre = @request_params["genre"]
        @request_params["genre"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["genre"] = genre
      end
    end

    context "create request with nil range" do
      it "get response with 400 status" do
        range = @request_params["range"]
        @request_params["range"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["range"] = range
      end
    end

    context "create request with nil context" do
      it "get response with 400 status" do
        context = @request_params["context"]
        @request_params["context"] = nil
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: @tourist_headers
        expect(JSON.parse(response.body)["status"]).to eq(400)
        @request_params["context"] = context
      end
    end

    context "create request with invalid headers" do
      it "get response with 200 status" do
        post "/api/v1/requests",
          params: @request_params.to_json,
          headers: {}
        expect(response.status).to eq(401)
      end
    end
  end
end
