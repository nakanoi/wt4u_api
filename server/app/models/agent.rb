class Agent < ApplicationRecord
  attr_accessible :user, :type, :area, :business

  belongs_to :user
  belongs_to :type
end
