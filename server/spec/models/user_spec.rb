require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "User model" do
    context "create user model" do
      it "successfully created" do
        expect(@user).to be_valid
      end
    end

    context "with null name" do
      it "'name must be exist' error occurs" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Name can\'t be blank'
        )
      end
    end

    context "multiple models with same name" do
      it "'name must be unique' error occurs" do
        @user.save
        @samename = FactoryBot.build(:samename)
        @samename.valid?
        expect(@samename.errors.full_messages).to include(
          'Name has already been taken'
        )
      end
    end

    context "with null email" do
      it "'email must be exist' error occurs" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Email can\'t be blank'
        )
      end
    end

    context "multiple models with same email" do
      it "'email must be unique' error occurs" do
        @user.save
        @sameemail = FactoryBot.build(:sameemail)
        @sameemail.valid?
        expect(@sameemail.errors.full_messages).to include(
          'Email has already been taken'
        )
      end
    end

    context "with null password" do
      it "'password must be exist' error occurs" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Password can\'t be blank'
        )
      end
    end

    context "with null password_comfirmation" do
      it "'password_confirmation must be exact to password' error occurs" do
        @user.password_confirmation = 'fake_password'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Password confirmation doesn\'t match Password'
        )
      end
    end

    context "different comfirmation" do
      it "'password must be encrypted' error occurs" do
        expect(@user.encrypted_password).to_not eq 'password'
      end
    end
  end
end
