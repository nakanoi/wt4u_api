class Agent < ApplicationRecord
  validates :user, presence: true, uniqueness: true
  validates :type, presence: true, uniqueness: true
  validates :area, presence: true
  validates :business, presence: true

  belongs_to :user
  belongs_to :type
end
