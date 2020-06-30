require 'rails_helper'

RSpec.feature "Visitor adds an item to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They add one item to cart" do

    visit root_path
    find_button("Add").click
    expect(page).to have_content("Cart (1)")
  end 
end
