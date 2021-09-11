class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver} #確保2位相同的使用者間不會有重複的 conversation
  belongs_to :space 

  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :direct_messages, -> { order(created_at: :asc) }, dependent: :destroy

  # 參與對話的兩位 user
  scope :participating, -> (user) do
    where("(conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end
  scope :belonging, -> (space) do
    where("(conversations.space_id = ?)", space.id)
  end

  def with(current_user) #current_user 是跟誰聊天
    author == current_user ? receiver : author
  end

  # def participates?(user)
  #   author == user || receiver == user
  # end
end
