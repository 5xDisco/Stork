class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  #與 space 的關聯
  has_many :users_spaces, dependent: :destroy
  has_many :spaces, through: :users_spaces
  #與 channel 的關聯
  has_many :user_channels, dependent: :destroy
  has_many :channels, through: :user_channels
  #與 message 的關聯
  has_many :messages, dependent: :destroy

  has_many :replies, dependent: :destroy

  has_many :tasks, dependent: :destroy

  extend FriendlyId
  friendly_id :friendly_params, use: :slugged

  def name
    email.split('@')[0]
  end

  def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.provider = provider_data.provider
      user.uid = provider_data.uid
    end
  end

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers "online"
    where(id: ids)
  end

  def online?
    User.online.ids.include?(id)
  end

  def display_name
    nickname || name
  end
end
