class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  after_create :process_mentions

  def process_mentions
    UnreadsChannel.broadcast_to channel, { mentions: mentioned_nicknames, content: content }
  end

  def mentioned_users
    User.where(nickname: mentioned_usernames) - [user]
  end

  def mentioned_nicknames
    content.scan(/@([\w-]+)/).flatten
  end
end
