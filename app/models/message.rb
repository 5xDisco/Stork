class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  after_create :process_mentions

  def process_mentions
    UnreadsChannel.broadcast_to channel, { mentions: mentioned_usernames, content: content }
  end

  def mentioned_users
    User.where(nickname: mentioned_usernames) - [user]
  end

  def mentioned_usernames
    content.scan(/@([\w-]+)/).flatten
  end
end
