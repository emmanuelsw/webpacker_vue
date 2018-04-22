class SignsController < ApplicationController
  def index
  end

  def create
    sign = Sign.new(sign_params)
    if sign.save
      render json: {created: true}, status: 201
    else
      render json: sign.errors.full_messages, status: 422
    end
  end

  private
  def sign_params
    params.permit(:name, :email, :birthdate, :phone, :sign)
  end
end