require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.create(:request)
  end

  describe "Request model" do
    context "create request" do
      it "successfully done" do
        @request.valid?
        expect(@request).to be_valid
      end
    end

    context "create request without title" do
      it "get 401, title must be exist" do
        @request.title = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Title can\'t be blank'
        )
      end
    end

    context "create request without area" do
      it "get 401, area must be exist" do
        @request.area = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Area can\'t be blank'
        )
      end
    end

    context "create request without cost" do
      it "get 401, cost must be exist" do
        @request.cost = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Cost can\'t be blank'
        )
      end
    end

    context "create request without number" do
      it "get 401, number must be exist" do
        @request.number = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Number can\'t be blank'
        )
      end
    end

    context "create request without date" do
      it "get 401, date must be exist" do
        @request.date = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Date can\'t be blank'
        )
      end
    end

    context "create request without days" do
      it "get 401, days must be exist" do
        @request.days = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Days can\'t be blank'
        )
      end
    end

    context "create request without genre" do
      it "get 401, genre must be exist" do
        @request.genre = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Genre can\'t be blank'
        )
      end
    end

    context "create request without range" do
      it "get 401, range must be exist" do
        @request.range = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Range can\'t be blank'
        )
      end
    end

    context "create request without context" do
      it "get 401, title must be exist" do
        @request.context = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Context can\'t be blank'
        )
      end
    end

    context "create request without status" do
      it "get 401, title must be exist" do
        @request.status = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Status can\'t be blank'
        )
      end
    end

    context "create request with nil name" do
      it "get 401, title must be exist" do
        @request.name = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'Name can\'t be blank'
        )
      end
    end

    context "create request with nil user ID" do
      it "get 401, title must be exist" do
        @request.user_id = nil
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'User can\'t be blank'
        )
      end
    end

    context "create request with nonexist user ID" do
      it "get 401, user must be exist" do
        @request.user_id = 1000000000
        @request.valid?
        expect(@request.errors.full_messages).to include(
          'User must exist'
        )
      end
    end
  end
end
