class Tourist < ApplicationRecord
  validates :user, presence: true, uniqueness: true
  validates :type, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :type
end
