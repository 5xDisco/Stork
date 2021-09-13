class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver} #確保2位相同的使用者間不會有重複的 conversation 

  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :direct_messages, -> { order(created_at: :asc) }, dependent: :destroy
end
