require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true  do
  before :each do
  @user = User.create!(
        first_name: "Brian",
        last_name: "Pepper",
        email: "Brian@gmail.com",
        password: "test1234",
        password_confirmation: "test1234"
        )
  end

  scenario "They can login" do
    visit ("/sessions/new")
    fill_in "email", with: "Brian@gmail.com"
    fill_in "password", with: "test1234"
    click_on "Submit"
    find_link "Logout"
    save_screenshot

  end

end
