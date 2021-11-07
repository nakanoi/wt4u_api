require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @member = FactoryBot.create(:member)
  end

  describe "Type model" do
    context "create member model" do
      it "successfully created tourist" do
        @member.valid?
        expect(@member).to be_valid
      end
    end

    context "create member with nil name" do
      it "'Name must exist' error occurs" do
        @member.name = nil
        @member.valid?
        expect(@member.errors.full_messages).to include(
          "Name can't be blank"
        )
      end
    end

    context "create member with nil user" do
      it "'User cant be blank' error occurs" do
        @member.user_id = nil
        @member.valid?
        expect(@member.errors.full_messages).to include(
          "User can't be blank"
        )
      end
    end

    context "create member with nil room" do
      it "'Room cant be blank' error occurs" do
        @member.room_id = nil
        @member.valid?
        expect(@member.errors.full_messages).to include(
          "Room can't be blank"
        )
      end
    end

    context "create member with non exist user" do
      it "'User must exist' error occurs" do
        @member.user_id = 100000000000
        @member.valid?
        expect(@member.errors.full_messages).to include(
          "User must exist"
        )
      end
    end

    context "create member with non exist room" do
      it "'Room must exist' error occurs" do
        @member.room_id = 100000000000
        @member.valid?
        expect(@member.errors.full_messages).to include(
          "Room must exist"
        )
      end
    end
  end
end
