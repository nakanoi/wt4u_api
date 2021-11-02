class Api::V1::TypesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :create]

  def index
    render json: {
      status: 200,
      user: current_api_v1_user,
      user_type: current_api_v1_user.type,
      user_agent: current_api_v1_user.agent,
      user_tourist: current_api_v1_user.tourist,
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
        if type_params[:type] == 'tourist'
          @tourist = Tourist.create(
            user_id: current_api_v1_user.id,
            type_id: @type.id,
          )
          @tourist.save
        end
        render json: {
          status: 200,
          user: current_api_v1_user,
          user_type: type_params[:type],
          user_agent: current_api_v1_user.agent,
          user_tourist: current_api_v1_user.tourist,
          message: 'Set user type.'
        }
      else
        render json: {
          status: 400,
          user: current_api_v1_user,
          user_type: "fail",
          user_agent: nil,
          user_tourist: nil,
          message: 'Failed to set type.'
        }
      end
    else
      render json: {
        status: 200,
        user: current_api_v1_user,
        user_type: current_api_v1_user.type,
        user_agent: current_api_v1_user.agent,
        user_tourist: current_api_v1_user.tourist,
        message: 'You\'ve already set user type.'
      }
    end
  end

  private
    def type_params
      params.permit(:type)
    end
end
