class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  after_commit :broadcast_me

  def broadcast_me
    ActionCable.server.broadcast "ChannelMessagesChannel:#{channel.id}", {
      message: MessagesController.render(partial: "messages/message", locals: { message: self })
    }
  end
end
