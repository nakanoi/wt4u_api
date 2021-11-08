class RoomSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :token
  has_many :users
end
