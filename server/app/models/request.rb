class Request < ApplicationRecord
  validates :title, presence: true
  validates :area, presence: true
  validates :cost, presence: true
  validates :number, presence: true
  validates :date, presence: true
  validates :days, presence: true
  validates :genre, presence: true
  validates :range, presence: true
  validates :context, presence: true
  validates :status, presence: true
  validates :user, presence: true

  belongs_to :user
end
