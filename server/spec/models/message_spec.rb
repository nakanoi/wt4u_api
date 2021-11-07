require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.create(:message)
  end

  describe "Message model" do
    context "create message model" do
      it "successfully done" do
        @message.valid?
        expect(@message).to be_valid
      end
    end

    context "create message model with nil context" do
      it "'Context must exist' error occurs" do
        @message.context = nil
        @message.valid?
        expect(@message.errors.full_messages).to include(
          "Context can't be blank"
        )
      end
    end

    context "create message model with nil user" do
      it "'User ID must exist' error occurs" do
        @message.user_id = nil
        @message.valid?
        expect(@message.errors.full_messages).to include(
          "User can't be blank"
        )
      end
    end

    context "create message model with nil room" do
      it "'Room ID must exist' error occurs" do
        @message.room_id = nil
        @message.valid?
        expect(@message.errors.full_messages).to include(
          "Room can't be blank"
        )
      end
    end

    context "create message model with nonexist user" do
      it "'User must exist' error occurs" do
        @message.user_id = 1000000000
        @message.valid?
        expect(@message.errors.full_messages).to include(
          "User must exist"
        )
      end
    end

    context "create message model with nonexist room" do
      it "'Room must exist' error occurs" do
        @message.room_id = 1000000000
        @message.valid?
        expect(@message.errors.full_messages).to include(
          "Room must exist"
        )
      end
    end
  end
end
