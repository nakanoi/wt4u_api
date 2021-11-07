require 'rails_helper'

RSpec.describe Type, type: :model do
  before do
    @tourist = FactoryBot.create(:type_tourist)
    @agent = FactoryBot.create(:type_agent)
  end

  describe "Type model" do
    context "create type model" do
      it "successfully created tourist" do
        @tourist.valid?
        expect(@tourist).to be_valid
      end
      it "successfully created agent" do
        @agent.valid?
        expect(@agent).to be_valid
      end
    end

    context "create tourist without type name" do
      it "get 401 response" do
        @tourist.user_type = nil
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User type can\'t be blank'
        )
      end
    end

    context "create tourist without user ID" do
      it "get 401 response" do
        @tourist.user_id = nil
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User can\'t be blank'
        )
      end
    end

    context "create tourist with non exist user ID" do
      it "get 401 response" do
        @tourist.user_id = 10000000
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User must exist'
        )
      end
    end

    context "create tourist with type registered uesr" do
      it "get 401 response" do
        @tourist.user_id = @agent.user_id
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User has already been taken'
        )
      end
    end

    context "create agent without type name" do
      it "get 401 response" do
        @agent.user_type = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User type can\'t be blank'
        )
      end
    end

    context "create agent tourist without user ID" do
      it "get 401 response" do
        @agent.user_id = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User can\'t be blank'
        )
      end
    end

    context "create agent with non exist user ID" do
      it "get 401 response" do
        @agent.user_id = 10000000
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User must exist'
        )
      end
    end

    context "create agent with type registered uesr" do
      it "get 401 response" do
        @agent.user_id = @tourist.user_id
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User has already been taken'
        )
      end
    end
  end
end
