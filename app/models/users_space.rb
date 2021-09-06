class UsersSpace < ApplicationRecord
  belongs_to :user
  belongs_to :space
end
