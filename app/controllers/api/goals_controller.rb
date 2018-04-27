class Api::GoalsController < ApplicationController
	before_action :set_sign, only: [:create]

	def create
		goal = @sign.goals.new(goal_params)
		if goal.save
			render json: goal, status: 201
		else
			render json: goal.errors.full_messages, status: 422
		end
	end
	
  def destroy
    goal = Goal.find(params[:id])
    if goal.destroy
      render json: {deleted: true}, status: 204
    else
      render json: goal.errors.full_messages, status: 422
    end
  end

	private
	def set_sign
		@sign = Sign.find(params[:sign_id])
	end

	def goal_params
		params.permit(:description)
	end
end