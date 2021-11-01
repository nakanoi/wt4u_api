class Api::V1::AgentsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[index create]

  def index
    render json: {
      status: 200,
      user: current_api_v1_user,
      user_type: current_api_v1_user.type,
      area: current_api_v1_user.agent.area,
      business: current_api_v1_user.agent.business,
      message: 'Here you are.',
    }
  end

  def create
    if current_api_v1_user.agent.nil?
      @agent = Agent.create(
        area: agent_params[:area],
        business: agent_params[:business],
        user_id: current_api_v1_user.id,
        type_id: current_api_v1_user.type.id,
      )
      if @agent.save
        render json: {
          status: 200,
          user: current_api_v1_user,
          user_type: current_api_v1_user.type,
          area: agent_params[:area],
          business: agent_params[:business],
          message: 'Set you as an agent.',
        }
      else
        render json: {
          status: 400,
          user: current_api_v1_user,
          user_type: nil,
          area: nil,
          business: nil,
          message: 'Failed to set as an agent.',
        }
      end
    else
      render json: {
        status: 200,
        user: current_api_v1_user,
        user_type: current_api_v1_user.type,
        area: current_api_v1_user.agent.area,
        business: current_api_v1_user.agent.business,
        message: 'You\'ve already set yourself as an agent.',
      }
    end
  end

  private
    def agent_params
      params.permit(:area, :business)
    end
end
