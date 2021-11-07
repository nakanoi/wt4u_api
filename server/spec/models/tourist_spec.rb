require 'rails_helper'

RSpec.describe Tourist, type: :model do
  before do
    @tourist = FactoryBot.create(:tourist)
  end

  describe "Type model" do
    context "create tourist model" do
      it "successfully done." do
        @tourist.valid?
        expect(@tourist).to be_valid
      end
    end

    context "create tourist model with nil user ID" do
      it "'User must not be blank' error occurs" do
        @tourist.user_id = nil
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User can\'t be blank'
        )
      end
    end

    context "create tourist model with nil type ID" do
      it "'Type must not be blank' error occurs" do
        @tourist.type_id = nil
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'Type can\'t be blank'
        )
      end
    end

    context "create tourist model with nonexist user ID" do
      it "'Uesr must exist' error occurs" do
        @tourist.user_id = 10000000000
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'User must exist'
        )
      end
    end

    context "create tourist model with nil type ID" do
      it "'Type must exist' error occurs" do
        @tourist.type_id = 10000000000
        @tourist.valid?
        expect(@tourist.errors.full_messages).to include(
          'Type must exist'
        )
      end
    end
  end
end
