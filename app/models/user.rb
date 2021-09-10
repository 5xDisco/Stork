<<<<<<< HEAD
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
end

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
=======
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_spaces, dependent: :destroy
  has_many :spaces, through: :users_spaces
  

  has_many :user_channels, dependent: :destroy
  has_many :channels, through: :user_channels
end
>>>>>>> develop
