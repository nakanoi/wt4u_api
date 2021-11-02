class Type < ApplicationRecord
  belongs_to :user
  has_one :agent, dependent: :destroy
  has_one :tourist, dependent: :destroy
end
