class RoomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @room = Room.find_by(token: params[:token])
    stream_for @room
  end

  def received(data)
    RoomsChannel.broadcast_to(
      @room,
      {
        room: @room,
        users: @room.members,
        messages: @room.messages
      }
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
