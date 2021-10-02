class UsersSpace < ApplicationRecord
  belongs_to :user , dependent: :destroy
  belongs_to :space , dependent: :destroy
end
