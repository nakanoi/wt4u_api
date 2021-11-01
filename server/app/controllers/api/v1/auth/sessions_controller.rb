class Api::V1::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      render json: {
        is_login: true,
        user: current_api_v1_user,
        message: 'Logged in.',
      }
    else
      render json: {
        is_login: false,
        user: nil,
        message: 'User does not exist.',
      }
    end
  end
end
