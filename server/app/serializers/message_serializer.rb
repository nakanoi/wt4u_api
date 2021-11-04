class MessageSerializer < ActiveModel::Serializer
  attributes :id, :room_id, :user_id, :context, :created_at
end
