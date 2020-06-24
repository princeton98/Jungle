class Admin::DashboardController < ApplicationController
  def show
     @number_products = Product.count 
     @number_categories = Category.count 
  end
end
