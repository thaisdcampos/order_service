module V1
  class OrdersController < ApplicationController
    def create
      order = Order.new(permitted_params.merge(user_permitted_params))

      if order.save
        render json: order, status: :created
      else
        render json: { errors: order.errors }, status: :unprocessable_entity
      end
    end

    def update
      order = Order.find(params[:id])
      order.address.update(update_permitted_params[:address_attributes])

      if order.save
        render json: order, include: :address, status: :ok
      else
        render json: { errors: order.errors }, status: :unprocessable_entity
      end
    end

    private

    def permitted_params
      params.permit(
        request_info: {},
        address_attributes: [
          :city,
          :neighborhood,
          :street,
          :uf,
          :zip_code
        ]
      )
    end

    def user_permitted_params
      params.require(:user_info).permit(
        :phone,
        :email,
        :name
      )
    end

    def update_permitted_params
      params.permit(
        address_attributes: [
          :latitude,
          :longitude
        ]
      )
    end
  end
end
