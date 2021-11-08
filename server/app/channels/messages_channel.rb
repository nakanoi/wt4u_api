class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts params
    rooms = Room.find(token: params[:token])
    stream_for rooms
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
