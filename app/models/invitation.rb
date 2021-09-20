class Invitation < ApplicationRecord
  enum status: { channel: 0, space: 1 }
end
