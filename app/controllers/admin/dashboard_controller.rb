class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'].to_s, password: ENV['PASSWORD'].to_s
  
  def show
  end
end

