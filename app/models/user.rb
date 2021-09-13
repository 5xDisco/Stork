class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #與 space 的關聯
  has_many :users_spaces, dependent: :destroy
  has_many :spaces, through: :users_spaces
  #與 channel 的關聯
  has_many :user_channels, dependent: :destroy
  has_many :channels, through: :user_channels
  #與 message 的關聯
  has_many :messages, dependent: :destroy
  
  def name
    email.split('@')[0]
  end
end
