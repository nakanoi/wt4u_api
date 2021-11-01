class Tourist < ApplicationRecord
  attr_accessible :user, :type

  belongs_to :user
  belongs_to :type
end
