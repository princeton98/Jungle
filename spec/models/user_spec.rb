require 'rails_helper'

RSpec.describe User, type: :model do
  describe "password and password_confirmation" do
    it "is not validated when different" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test123",
        password_confirmation: "tes123"
      )
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is validated when they match" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user.save).to be true
    end
  end

  describe "Email" do
    it "must be unique" do
    end
  end

  it "Validates when email, first name, and last name are entered"
end
