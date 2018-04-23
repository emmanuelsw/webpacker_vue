class SignsController < ApplicationController
  def index
    render json: Sign.all
  end

  def create
    sign = Sign.new(sign_params)
    if sign.save
      render json: {created: true}, status: 201
    else
      render json: sign.errors.full_messages, status: 422
    end
  end

  def destroy
    sign = Sign.find(params[:id])
    if sign.destroy
      render json: {deleted: true}, status: 204
    else
      render json: sign.errors.full_messages, status: 422
    end
  end

  private
  def sign_params
    params.permit(:name, :email, :birthdate, :phone, :sign)
  end
end