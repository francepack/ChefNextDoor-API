class HomeController < ApplicationController
  def index
    @vendors = Vendor.all
    render json: @vendors
  end
end