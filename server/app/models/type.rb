class Type < ApplicationRecord
  validates :user_type, presence: true
  validates :user, presence: true, uniqueness: true

  belongs_to :user
  has_one :agent, dependent: :destroy
  has_one :tourist, dependent: :destroy
end
