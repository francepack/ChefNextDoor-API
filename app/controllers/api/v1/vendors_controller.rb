module Api
  module V1
    class VendorsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]

      before_action :set_vendor, only: [:show, :update, :destroy]
      # GET /vendors
      def index
        @vendors = Vendor.all

        render json: @vendors
      end

      # GET /vendors/1
      def show
        render json: @vendor
      end

      # POST /vendors
      def create
        @vendor = Vendor.new(vendor_params)

        if @vendor.save
          render json: @vendor, status: :created, location: @vendor
        else
          render json: @vendor.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /vendors/1
      def update
        if @vendor.update(vendor_params)
          render json: @vendor
        else
          render json: @vendor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /vendors/1
      def destroy
        @vendor.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_vendor
          @vendor = Vendor.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def vendor_params
          params.require(:vendor).permit(:name, :user_id)
        end
    end
  end
end
