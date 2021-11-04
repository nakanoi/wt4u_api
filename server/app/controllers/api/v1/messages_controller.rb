class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :create, :show]

  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new(
      room_id: message_params[:room_id],
      user_id: current_api_v1_user.id,
      context: message_params[:context],
    )
    room = Room.find(message_params[:room_id])
    if message.save
      RoomsChannel.broadcast_to(
        room,
        {
          room: room,
          users: room.members,
          messages: room.messages
        }
      )
    end
    render json: message
  end

  private
    def message_params
      params.permit(:room_id, :context, :user_id)
    end
end
