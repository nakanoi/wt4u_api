require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.create(:room)
  end

  describe "Model Room" do
    context "create room model" do
      it "successfully done" do
        @room.valid?
        expect(@room).to be_valid
      end
    end

    context "create room model without title" do
      it "title must exist" do
        @room.title = nil
        @room.valid?
        expect(@room.errors.full_messages).to include(
          "Title can't be blank"
        )
      end
    end
  end

  context "create room model without token" do
    it "token must exist" do
      @room.token = nil
      @room.valid?
      expect(@room.errors.full_messages).to include(
        "Token can't be blank"
      )
    end
  end
end
