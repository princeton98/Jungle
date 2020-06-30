require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "password is not validated when different" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "tes123"
      )
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password is validated when they match" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user.save).to be true
    end

    it "password is not validated when having a password length less than 8" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
    it "email must be unique" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      @user2 = User.create(
        first_name: "Brain",
        last_name: "Pepper",
        email: "BriaN@gmAil.COM",
        password: "test4321",
        password_confirmation: "test4321"
      )
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "validates when entered" do
      @user = User.create(
      first_name: "Brian",
      last_name: "Pepper",
      email: "Brian@gmail.com",
      password: "test1234",
      password_confirmation: "test1234"
      )
    expect(@user.save).to be true 
    end

    it "doesn't validate when missing email" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: nil,
        password: "test1234",
        password_confirmation: "test1234"
        )
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "doesn't validate when missing first name" do
      @user = User.create(
        first_name: nil,
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "doesn't validate when missing last name" do
      @user = User.create(
        first_name: "Brian",
        last_name: nil,
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do 
    it "authenticates when given an email and username from the database" do
       @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
      user_auth = User.authenticate_with_credentials("Brian@gmail.com", "test1234")
      expect(user_auth).to eq(@user)
    end
    it "doesn't authenticate when given an email and username not from the database" do
      user_auth = User.authenticate_with_credentials("Poppa@gmail.com", "testquestion1234")
      expect(user_auth).to be nil
    end
    
    it "authenticates when putting spaces in front of and after the email" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
      user_auth = User.authenticate_with_credentials(" Brian@gmail.com ", "test1234")
      expect(user_auth).to eq(@user)
    end

    it "authenticates when submitting wrong cases for email" do
      @user = User.create(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
      user_auth = User.authenticate_with_credentials("BriAN@gMaIl.cOm ", "test1234")
      expect(user_auth).to eq(@user)
    end
  end
end
