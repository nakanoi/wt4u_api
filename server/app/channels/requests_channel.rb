class RequestsChannel < ApplicationCable::Channel
  def subscribed
    Request.all.each do |request|
      stream_for request
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
