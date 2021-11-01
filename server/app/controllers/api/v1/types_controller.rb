class Api::V1::TypesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[index create]

  def index
    render json: {
      status: 200,
      user: current_api_v1_user,
      user_type: current_api_v1_user.type,
      message: 'Here you are.'
    }
  end

  def create
    if current_api_v1_user.type.nil?
      @type = Type.create(
        user_id: current_api_v1_user.id,
        user_type: type_params[:type],
      )
      if @type.save
        render json: {
          status: 200,
          user: current_api_v1_user,
          user_type: type_params[:type],
          message: 'Set user type.'
        }
      else
        render json: {
          status: 400,
          user: current_api_v1_user,
          user_type: "fail",
          message: 'Failed to set type.'
        }
      end
    else
      render json: {
        status: 200,
        user: current_api_v1_user,
        user_type: current_api_v1_user.type,
        message: 'You\'ve already set user type.'
      }
    end
  end

  private
    def type_params
      params.permit(:type)
    end
end
