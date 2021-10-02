class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  # trix editor
  has_rich_text :content
  # has_many_attached :uploads
  # after_commit :broadcast_me
  has_many :replies, dependent: :destroy

  after_create :process_mentions

  def process_mentions
    UnreadsChannel.broadcast_to channel, { mentions: mentioned_nicknames, content: content, channel_id: channel.id, user_id: user.id }
  end

  def mentioned_users
    User.where(nickname: mentioned_nicknames) - [user]
  end

  def mentioned_nicknames
    content.to_plain_text.scan(/@([\w-]+|[\u4E00-\u9FFF-]+)/).flatten
  end
end
