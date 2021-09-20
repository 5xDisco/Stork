class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :space
  belongs_to :channel
  enum status: { channel: 0, space: 1 }
end
