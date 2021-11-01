class Type < ApplicationRecord
  attr_accessible :user, :user_type

  belongs_to :user
  has_one :agent, dependent: :destroy
  has_one :tourist, dependent: :destroy
end
