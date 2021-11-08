class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :rooms
  has_many :rooms
end
