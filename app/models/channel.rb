class Channel < ApplicationRecord
	acts_as_paranoid

	validates :name, presence: true
	belongs_to :space
	has_many :user_channels, dependent: :destroy
	has_many :users, through: :user_channels
	has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy 
	enum is_public: { private_channel: 0, public_channel: 1, lobby_channel: 2 }
	scope :lobby_channels, -> { where(is_public: 'lobby_channel', direct_message: false) }
	scope :direct_messages, -> { where(direct_message: true) }

	def self.direct_message_for_users(users, space_id)
		user_ids = users.map(&:id).sort
		name = "DM:#{user_ids.join(":")}"

		if channel = direct_messages.where(name: name).first
			channel
		else
			channel = Channel.new(name: name, direct_message: true, space_id: space_id)
			channel.users = users
			channel.save
			channel
		end
	end
	
	def has_unread_message?(user, space)
		user_channels = user.channels.includes(:messages).where(space: space)
    @unread_message = {}
    user_channels.each do |channel|
    @unread_message[channel.id] = channel.messages.where("created_at > ? AND user_id != ?", 
      channel.user_channels.find_by(user_id: user.id).last_read_at, user.id)
      .present?	
    end
		@unread_message[id]
	end
	
	def unread_message_count(user)
		messages.where("created_at > ? AND user_id != ?", 
      user_channels.find_by(user_id: user.id)&.last_read_at, 
			user.id)
      .count
	end
end
