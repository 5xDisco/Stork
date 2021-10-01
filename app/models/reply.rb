class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :user

  # trix editor
  has_rich_text :content
  after_commit :broadcast_me

  def broadcast_me
    ActionCable.server.broadcast "ReplyChannel:#{self.message_id}", {
      message: RepliesController.render(partial: 'reply', locals: { reply: self })
    }
  end

end
