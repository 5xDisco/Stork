class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  has_many :replies, dependent: :destroy
  
	extend FriendlyId
  friendly_id :friendly_params, use: :slugged

  after_create :process_mentions

  def process_mentions
    UnreadsChannel.broadcast_to channel, { mentions: mentioned_nicknames, content: content, channel_id: channel.id, user_id: user.id }
  end

  def mentioned_users
    User.where(nickname: mentioned_nicknames) - [user]
  end

  def mentioned_nicknames
    content.scan(/@([\w-]+|[\u4E00-\u9FFF-]+)/).flatten
  end
end
