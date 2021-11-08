class Member < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true
  validates :room, presence: true

  belongs_to :user
  belongs_to :room
end
