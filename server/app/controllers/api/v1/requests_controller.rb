class Api::V1::RequestsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :create, :show]

  def index
    requests = Request.all
    render json: requests
  end

  def show
    requests = Request.find(params[:id])
  end

  def create
    request = Request.new(
      area: request_params[:area],
      title: request_params[:title],
      cost: request_params[:cost],
      number: request_params[:number],
      date: request_params[:date],
      days: request_params[:days],
      genre: request_params[:genre],
      range: request_params[:range],
      context: request_params[:context],
      status: true,
      user_id: current_api_v1_user.id,
    )
    if request.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        RequestSerializer.new(request)
      ).serializable_hash
      ActionCable.server.broadcast 'requests_channel', serialized_data
      head :ok
    end
  end

  private
    def request_params
      params.require(
        :area,
        :title,
        :cost,
        :number,
        :date,
        :days,
        :genre,
        :range,
        :context,
      ).permit(
        :area,
        :title,
        :cost,
        :number,
        :date,
        :days,
        :genre,
        :range,
        :context,
      )
    end
end
