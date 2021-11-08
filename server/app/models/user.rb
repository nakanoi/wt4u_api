# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_one :type, dependent: :destroy
  has_one :agent, dependent: :destroy
  has_one :tourist, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :messages
  has_many :members
  has_many :rooms, through: :members
end
