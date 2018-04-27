class Api::SignsController < ApplicationController
	def index
		sign = Sign.select(:id, :name, :email, :phone, :birthdate)
    render json: SignSerializer.new(sign).serialized_json
  end

  def show
    sign = Sign.find(params[:id])
    render json: {sign: sign, goals: sign.goals.select(:id, :description)}
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