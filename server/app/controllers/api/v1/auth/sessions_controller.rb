class Api::V1::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      render json: {
        is_login: true,
        user: current_api_v1_user,
        type: current_api_v1_user.type,
        agent: current_api_v1_user.agent,
        message: 'Logged in.',
        rooms: current_api_v1_user.rooms,
      }
    else
      render json: {
        is_login: false,
        user: nil,
        type: nil,
        agent: nil,
        message: 'User does not exist.',
        rooms: nil,
      }
    end
  end
end
