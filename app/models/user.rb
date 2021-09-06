class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :space_members
  has_many :spaces, through: :space_members

  has_many :user_channels
  has_many :channels, through: :user_channels
end
