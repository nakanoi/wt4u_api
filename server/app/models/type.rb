class Type < ApplicationRecord
  attr_accessible :user, :user_type

  belongs_to :user
end
