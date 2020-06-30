require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves when all four fields are set" do
      @category = Category.find_or_create_by! name: 'Apparel'
      @products = @category.products.create!(({
      name:  'Women\'s Zebra pants',
      quantity: 18,
      price: 124.99
    }))
    expect(@products.save).to be true
    end

    it "does not save when name is not set" do
      @category = Category.find_or_create_by! name: 'Apparel'
      @products = @category.products.create(({
        name: nil,
        quantity: 18,
        price: 124.99
      }))
      expect(@products.errors.full_messages).to include("Name can't be blank")
    end

    it "does not save when price is not set" do
      @category = Category.find_or_create_by! name: 'Apparel'
      @products = @category.products.create(({
        name: 'Women\s Zebra pants',
        quantity: 18,
        price: nil
      }))
      expect(@products.errors.full_messages).to include("Price can't be blank")
    end

    it "does not save when quantity is not set" do
      @category = Category.find_or_create_by! name: 'Apparel'
      @products = @category.products.create(({
        name: 'Women\s Zebra pants',
        quantity: nil,
        price: 124.99
      }))
      expect(@products.errors.full_messages).to include("Quantity can't be blank")
    end

    it "does not save when category is not set" do
      @products = Product.create(({
        name: 'Women\s Zebra pants',
        quantity: 18,
        price: 124.99
      }))
      expect(@products.errors.full_messages).to include("Category can't be blank")
    end

  end

end
