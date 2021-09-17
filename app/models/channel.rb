class Channel < ApplicationRecord
	acts_as_paranoid

	validates :name, presence: true
	belongs_to :space
	has_many :user_channels, dependent: :destroy
	has_many :users, through: :user_channels
	has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy 
	
	scope :public_channels, -> { where(is_public: true, direct_message: false) }
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
end
