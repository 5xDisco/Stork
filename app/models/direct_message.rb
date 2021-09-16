class DirectMessage < ApplicationRecord
  validates :content, presence: true

  belongs_to :conversation
  belongs_to :user
end
