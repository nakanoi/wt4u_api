require 'rails_helper'

RSpec.describe Agent, type: :model do
  before do
    @agent = FactoryBot.create(:agent)
  end

  describe "Type model" do
    context "create agent model" do
      it "successfully done." do
        @agent.valid?
        expect(@agent).to be_valid
      end
    end

    context "create agent model with nil user ID" do
      it "'User must not be blank' error occurs" do
        @agent.user_id = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User can\'t be blank'
        )
      end
    end

    context "create agent model with nil type ID" do
      it "'Type must not be blank' error occurs" do
        @agent.type_id = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'Type can\'t be blank'
        )
      end
    end

    context "create agent model with nil area" do
      it "'Area must not be blank' error occurs" do
        @agent.area = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'Area can\'t be blank'
        )
      end
    end

    context "create agent model with nil business" do
      it "'Business must not be blank' error occurs" do
        @agent.business = nil
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'Business can\'t be blank'
        )
      end
    end

    context "create agent model with nonexist user ID" do
      it "'Uesr must exist' error occurs" do
        @agent.user_id = 10000000000
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'User must exist'
        )
      end
    end

    context "create agent model with nil type ID" do
      it "'Type must exist' error occurs" do
        @agent.type_id = 10000000000
        @agent.valid?
        expect(@agent.errors.full_messages).to include(
          'Type must exist'
        )
      end
    end
  end
end
