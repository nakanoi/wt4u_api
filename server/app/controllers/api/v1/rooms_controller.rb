class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :create, :show]

  def index
    rooms = current_api_v1_user.rooms
    render json: rooms
  end

  def show
    room = Room.find_by(token: params[:id])
    render json: {
      id: room.id,
      title: room.title,
      token: room.token,
      users: room.members,
      messages: room.messages,
    }
  end

  def create
    room = Room.new(
      title: room_params[:title],
      token: room_params[:token],
    )
    if room.save
      member = Member.new(
        user_id: current_api_v1_user.id,
        room_id: room.id,
        name: current_api_v1_user.name,
      ).save
      member = Member.new(
        user_id: room_params[:poster],
        room_id: room.id,
        name: User.find(room_params[:poster]).name,
      ).save
      render json: room
    else
      render json: {
        status: 400,
        message: "invalid paramators",
      }
    end
  end

  private
    def room_params
      params.permit(:title, :token, :poster)
    end

end
