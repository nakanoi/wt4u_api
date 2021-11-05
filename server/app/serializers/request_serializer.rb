class RequestSerializer < ActiveModel::Serializer
  attributes :id, :area, :title, :cost, :number, :date, :days, :genre, :range, :context, :status, :user_id, :created_at
  attribute :name do 
    object.user.name
  end
end
